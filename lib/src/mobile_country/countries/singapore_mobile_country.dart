part of '../base_mobile_country.dart';

class SingaporeMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Singaporean mobile numbers.
    // Singaporean mobile numbers start with 8 or 9 followed by 7 digits.
    RegExp singaporePattern = RegExp(r'^65[0-9]{8}$');

    // Check if the provided mobile number matches the Singaporean pattern.
    return singaporePattern.hasMatch(mobile);
  }

  @override
  String get code => '65';

  @override
  String formatMobile(String mobile) {
    // Remove any non-digit characters from the mobile number
    String cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned mobile number is empty
    if (cleanMobile.isEmpty) {
      return '';
    } else if (cleanMobile.length <= 2) {
      return cleanMobile;
    }

    // Extract the parts of the mobile number
    String countryCode = cleanMobile.substring(0, 2);
    String formattedMobile = '+$countryCode';

    if (cleanMobile.length >= 2) {
      int end = cleanMobile.length > 6 ? 6 : cleanMobile.length;

      String subscriberCode = cleanMobile.substring(2, end);
      formattedMobile += ' $subscriberCode';

      if (cleanMobile.length >= 6) {
        String subscriberNumber = cleanMobile.substring(6, cleanMobile.length);
        formattedMobile += '-$subscriberNumber';

        // if (cleanMobile.length >= 11) {
        //   String remainingNumbers = cleanMobile.substring(8);
        //   formattedMobile += remainingNumbers;
        // }
      }
    }

    // Return the formatted mobile number
    return formattedMobile;
  }

  @override
  String get name => 'Singapore';
}
