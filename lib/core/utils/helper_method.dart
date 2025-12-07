import 'package:alora/core/config/app_constants.dart';
import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/general_type.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/storage/secure_storage_service.dart';

class HelperMethod{
  HelperMethod._();
  static void emptyCallback() {}

  static String getGeneralTitleByType(GeneralType generalType) {
    return switch(generalType){
      GeneralType.termsAndCondition => AppStrings.termsAndCondition,
      GeneralType.privacyPolicy => AppStrings.privacyPolicy,
      GeneralType.aboutUs => AppStrings.aboutUs,
    };
  }

  static Future<RoleType> getRoleType() async{
    final String? roleType = await SecureStorageService().read(AppConstants.roleType);
    if(roleType == null){
      return RoleType.renter;
    }
    if(roleType == "renter"){
      return RoleType.renter;
    }
    else if(roleType == "owner"){
      return RoleType.owner;
    }
    else if(roleType == "agent"){
      return RoleType.agent;
    }
    else{
      return RoleType.crew;
    }
  }

  static Future<void> clearAllSecureStorage() async{
    await SecureStorageService().clear();
  }

}