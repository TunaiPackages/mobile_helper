part of '../base_mobile_country.dart';

final class PhilippinesMobileCountry extends MobileCountry {
  static const PhilippinesMobileCountry instance = PhilippinesMobileCountry._();
  const PhilippinesMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    // Philippine mobiles are ten national digits after +63, starting with
    // 9 (+63 917 123 4567), or 8 for a few ranges. The country code is
    // required: with it optional, +63 and eight digits passed as ten
    // digits and the phone pad stopped two digits short.
    RegExp philippinesPattern = RegExp(r'^63[89]\d{9}$');

    return philippinesPattern.hasMatch(mobile);
  }

  @override
  String get code => '63';

  @override
  String formatMobile(String mobile) {
    // Remove any non-numeric characters, just in case
    mobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Ensure the number starts with the correct country code
    if (mobile.startsWith('09')) {
      // Local format, replace '0' with '63'
      mobile = '63' + mobile.substring(1);
    } else if (mobile.startsWith('63')) {
      // Already in the correct format
    } else {
      // Return the original if it doesn't match expected format
      return mobile;
    }

    // Return the number with a '+' prefix
    return '+$mobile';
  }

  @override
  String get name => 'Philippines';

  @override
  String get flagAssetName => 'ph.png';
}
