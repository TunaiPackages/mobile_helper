part of '../base_mobile_country.dart';

class PhilippinesMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression for validating Philippine mobile numbers
    RegExp philippinesPattern = RegExp(r'^(?:\+?63|0)?[0-9]{10}$');

    // The pattern breakdown:
    // ^(?:\+?63|0)? - Matches the optional country code '+63' or leading '0'.
    // [0-9]{10}$ - Matches exactly 10 digits for the mobile number.

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
}
