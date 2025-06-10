import 'package:alora/core/config/app_strings.dart';
import 'package:alora/core/enums/general_type.dart';

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
}