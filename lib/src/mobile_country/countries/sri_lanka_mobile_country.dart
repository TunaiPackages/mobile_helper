part of '../base_mobile_country.dart';

class SriLankaMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Sri Lankan mobile numbers.
    // This checks for numbers starting with '94' or '0' followed by 9 digits.
    RegExp sriLankaPattern = RegExp(r'^(?:94|0)?7[0-9]{8}$');

    return sriLankaPattern.hasMatch(mobile);
  }

  @override
  String get code => '94';

  @override
  String formatMobile(String mobile) {
    // Remove any non-numeric characters, just in case
    mobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Ensure the number starts with the correct country code
    if (mobile.startsWith('0')) {
      // Local format, replace '0' with '94'
      mobile = '94' + mobile.substring(1);
    } else if (mobile.startsWith('94')) {
      // Already in the correct format
    } else {
      // Return the original if it doesn't match the expected format
      return mobile;
    }

    // Return the number with a '+' prefix
    return '+$mobile';
  }

  @override
  String get name => 'Sri Lanka';
}
