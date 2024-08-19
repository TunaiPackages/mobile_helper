part of '../base_mobile_country.dart';

class IndonesiaMobileCountry extends BaseMobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Indonesian mobile numbers.
    // This checks for raw numbers without the '+' symbol.
    RegExp indonesiaPattern = RegExp(r'^62?8[1-9][0-9]{7,10}$');

    return indonesiaPattern.hasMatch(mobile);
  }

  @override
  String get code => '62';

  @override
  String formatMobile(String mobile) {
    // Remove any non-numeric characters, just in case
    mobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Ensure the number starts with the correct country code
    if (mobile.startsWith('08')) {
      // Local format, replace '0' with '62'
      mobile = '62' + mobile.substring(1);
    } else if (mobile.startsWith('62')) {
      // Already in the correct format
    } else {
      // Return the original if it doesn't match expected format
      return mobile;
    }

    // Return the number with a '+' prefix
    return '+$mobile';
  }

  @override
  String get name => 'Indonesia';
}
