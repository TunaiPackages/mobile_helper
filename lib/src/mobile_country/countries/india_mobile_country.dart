part of '../base_mobile_country.dart';

class IndiaMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Indian mobile numbers.
    // This checks for numbers starting with '91' or '0' followed by 10 digits.
    RegExp indiaPattern = RegExp(r'^(?:91|0)?[6-9][0-9]{9}$');

    return indiaPattern.hasMatch(mobile);
  }

  @override
  String get code => '91';

  @override
  String formatMobile(String mobile) {
    // Remove any non-numeric characters, just in case
    mobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Ensure the number starts with the correct country code
    if (mobile.startsWith('0')) {
      // Local format, replace '0' with '91'
      mobile = '91' + mobile.substring(1);
    } else if (mobile.startsWith('91')) {
      // Already in the correct format
    } else {
      // Return the original if it doesn't match the expected format
      return mobile;
    }

    // Return the number with a '+' prefix
    return '+$mobile';
  }

  @override
  String get name => 'India';
}
