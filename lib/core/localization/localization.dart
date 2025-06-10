import 'package:get/get.dart';
import 'bn_bn.dart';
import 'en_us.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
    'en_US': EnUs.translations,
    'bn_Bn': BnBn.translations,
  };
}
