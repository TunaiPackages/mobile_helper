part of '../base_mobile_country.dart';

class ChinaMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Chinese mobile numbers.
    // Chinese mobile numbers start with 86 followed by 11 digits (1xx-XXXX-XXXX format).
    // The first digit after 86 must be 1, and the second digit can be 3-9.
    RegExp chinaPattern = RegExp(r'^86[1][3-9][0-9]{9}$');

    // Check if the provided mobile number matches the Chinese pattern.
    return chinaPattern.hasMatch(mobile);
  }

  @override
  String get code => '86';

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
  String get name => 'China';
}