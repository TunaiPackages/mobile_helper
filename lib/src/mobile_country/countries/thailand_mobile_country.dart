part of '../base_mobile_country.dart';

class ThailandMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Thai mobile numbers.
    // Thai mobile numbers typically start with 66 followed by 9 digits.
    RegExp thailandPattern = RegExp(r'^66[0-9]{9}$');

    // Check if the provided mobile number matches the Thai pattern.
    return thailandPattern.hasMatch(mobile);
  }

  @override
  String get code => '66';

  @override
  String formatMobile(String mobile) {
    // Remove any non-digit characters from the mobile number
    String cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned mobile number is empty
    if (cleanMobile.isEmpty) {
      return '';
    } else if (cleanMobile.length < 2) {
      return cleanMobile;
    }

    // Extract the parts of the mobile number
    String countryCode =
        cleanMobile.substring(0, 2); // Use only 2 digits for country code
    String formattedMobile = '($countryCode)';

    if (cleanMobile.length > 2) {
      int end = cleanMobile.length > 5 ? 5 : cleanMobile.length;

      String subscriberCode = cleanMobile.substring(2, end);
      formattedMobile += ' $subscriberCode';

      if (cleanMobile.length > 5) {
        String subscriberNumber = cleanMobile.substring(5, cleanMobile.length);
        formattedMobile += '-$subscriberNumber';
      }
    }

    // Return the formatted mobile number
    return formattedMobile;
  }

  @override
  String get name => 'Thailand';
}
