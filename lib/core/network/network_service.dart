import 'dart:io';
import 'package:dio/dio.dart';
import 'package:alora/core/config/app_constants.dart';
import 'package:alora/core/error/exception_handler.dart';
import 'package:alora/core/error/exceptions.dart';
import 'package:alora/core/storage/secure_storage_service.dart';
import 'package:alora/core/utils/logger_utils.dart';
part 'package:alora/core/enums/http_method.dart';
part 'package:alora/core/config/app_api_endpoints.dart';

/// A service class for handling network requests using Dio.
///
/// - Supports GET, POST, PUT, PATCH, DELETE
/// - Handles secure token headers via [SecureStorageService]
/// - Supports JSON and multipart (file) uploads
/// - Deserializes single or list responses via [fromJson]
class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  /// Returns the singleton instance.
  factory NetworkService() => _instance;
  late Dio _dio;

  /// Private constructor initializes Dio with interceptors and base options.
  NetworkService._internal(){
    _dio = Dio(BaseOptions(
      baseUrl: AppConstants.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: <String, dynamic>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ));

    /// [interceptors] interceptors for dio
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async{
        final String? token = await SecureStorageService().read(AppConstants.authToken);
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        LoggerUtils.debug("onRequest: Method = ${options.method} || Uri = ${options.uri} || Headers = ${options.headers} || Data = ${options.data}");
        return handler.next(options);
      },
      onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) {
        LoggerUtils.info("onResponse: ${response.statusCode} ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        LoggerUtils.error("onError: ${e.response?.statusCode} ${e.message}");
        return handler.next(e);
      },
    ));
  }

  /// [handleRequest] Handles network requests that return a single object or primitive value.
  Future<T> handleRequest<T>({
    required HttpMethod httpMethod,
    required String endpoint,
    T Function(Map<String, dynamic>)? fromJson,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, List<File>>? fileFields
  }) async {
    try {
      final Response<dynamic> response = await _sendRequest(httpMethod, endpoint, queryParameters, data, fileFields);
      return _parseResponse<T>(response: response, fromJson: fromJson);
    }
    on DioException catch (exception) {
      throw ExceptionHandler.handleDioError(exception);
    }
    catch (exception) {
      throw UnknownException("Unexpected Error: ${exception.toString()}");
    }
  }

  /// [handleListRequest] network requests that return a list of objects.
  Future<List<T>> handleListRequest<T>({
    required HttpMethod httpMethod,
    required String endpoint,
    T Function(Map<String, dynamic>)? fromJson,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, List<File>>? fileFields
  }) async {
    try {
      final Response<dynamic> response = await _sendRequest(httpMethod, endpoint, queryParameters, data, fileFields);
      return _parseListResponse<T>(response: response, fromJson: fromJson);
    }
    on DioException catch (exception) {
      throw ExceptionHandler.handleDioError(exception);
    }
    catch (exception) {
      throw UnknownException("Unexpected Error: ${exception.toString()}");
    }
  }


  /// [_sendRequest] Sends the network request using the appropriate HTTP method.
  Future<Response<dynamic>> _sendRequest(
      HttpMethod httpMethod,
      String endpoint,
      Map<String, dynamic>? queryParameters,
      dynamic data,
      Map<String, List<File>>? fileFields
      ) async {
    switch(httpMethod){
      case HttpMethod.get:
        return await _dio.get(endpoint, queryParameters:  queryParameters);
      case HttpMethod.post:
        return await _dio.post(endpoint, data: _prepareData(data, fileFields));
      case HttpMethod.put:
        return await _dio.put(endpoint, data: _prepareData(data, fileFields));
      case HttpMethod.patch:
        return await _dio.patch(endpoint, data: _prepareData(data, fileFields));
      case HttpMethod.delete:
        return await _dio.delete(endpoint, queryParameters: queryParameters);
    }
  }

  /// [_prepareData]  Prepares data for request, including handling multipart file uploads.
  dynamic _prepareData(dynamic data, Map<String, List<File>>? fileFields) {
    final FormData formData = FormData.fromMap(
      data is Map<String, dynamic> ? data : <String, dynamic>{},
    );

    if (fileFields != null && fileFields.isNotEmpty) {
      for (final MapEntry<String, List<File>> entry in fileFields.entries) {
        final String fieldName = entry.key;
        final List<File> files = entry.value;

        for (final File file in files) {
          formData.files.add(
            MapEntry<String, MultipartFile>(
              fieldName,
              MultipartFile.fromFileSync(
                file.path,
                contentType: DioMediaType('image', file.path.split('.').last.toLowerCase()),
                filename: file.uri.pathSegments.last,
              ),
            ),
          );
        }
      }
    }
    if(fileFields != null && fileFields.isNotEmpty){
      return formData;
    }
    else{
      return data;
    }
  }

  /// [_parseResponse] Parses the Dio response and returns a single object.
  Future<T> _parseResponse<T>({required Response<dynamic> response, T Function(Map<String, dynamic>)? fromJson}) async {
    if (response.statusCode == null || response.statusCode! < 200 || response.statusCode! >= 300) {
      throw ExceptionHandler.handleErrorStatus(response);
    }
    if (fromJson != null) {
      if (response.data is Map<String, dynamic>) {
        return fromJson(response.data as Map<String, dynamic>);
      }
    }
    if (response.data is T) {
      return response.data as T;
    }
    return response.data;
  }

  /// [_parseListResponse] Parses a Dio response and returns a list of deserialized objects.
  List<T> _parseListResponse<T>({required Response<dynamic> response, T Function(Map<String, dynamic>)? fromJson,}) {
    if (response.statusCode == null || response.statusCode! < 200 || response.statusCode! >= 300) {
      throw ExceptionHandler.handleErrorStatus(response);
    }

    final dynamic responseData = response.data;

    if (fromJson != null) {
      if (responseData is List) {
        return responseData.map((dynamic json) {
          if (json is Map<String, dynamic>) {
            return fromJson(json);
          } else {
            throw TypeException("Expected Map<String, dynamic> but got ${json.runtimeType}", code: response.statusCode);
          }
        }).toList();
      }
      else {
        throw TypeException("Unexpected response type: ${responseData.runtimeType}, expected List", code: response.statusCode);
      }
    }
    return <dynamic>[responseData] as List<T>;
  }

}
