part of '../base_mobile_country.dart';

class BruneiMobileCountry extends BaseMobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Brunei mobile numbers.
    // This checks for raw numbers without the '+' symbol.

    RegExp bruneiPattern = RegExp(r'^(?:673)?7[0-9]{6}$');

    // Brunei mobile numbers typically start with '7' and are 7 digits long.
    return bruneiPattern.hasMatch(mobile);
  }

  @override
  String get code => '673';

  @override
  String formatMobile(String mobile) {
    // Remove any non-numeric characters, just in case
    mobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Ensure the number starts with the correct country code
    if (mobile.startsWith('7')) {
      // Local format, prepend '673'
      mobile = '673' + mobile;
    } else if (mobile.startsWith('673')) {
      // Already in the correct format
    } else {
      // Return the original if it doesn't match expected format
      return mobile;
    }

    // Return the number with a '+' prefix
    return '+$mobile';
  }

  @override
  String get name => 'Brunei';
}
