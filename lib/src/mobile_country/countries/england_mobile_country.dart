part of '../base_mobile_country.dart';

class EnglandMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match English mobile numbers
    // English mobile numbers typically start with +44 or 07 followed by 9 digits.
    RegExp englandPattern = RegExp(r'^(447\d{9}|07\d{9})$');

    // Check if the provided mobile number matches the England pattern
    return englandPattern.hasMatch(mobile);
  }

  @override
  String get code => '44';

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

    // Handle both +44 and 07 formats
    String countryCode =
        cleanMobile.startsWith('44') ? cleanMobile.substring(0, 2) : '44';
    String formattedMobile = '($countryCode)';

    if (cleanMobile.length > 2) {
      int startIndex = cleanMobile.startsWith('44')
          ? 2
          : 1; // If it starts with +44, start formatting from 2nd digit

      // Ensure we don't exceed the string length when extracting subscriber code
      int subscriberCodeEnd =
          (startIndex + 3).clamp(startIndex, cleanMobile.length);
      String subscriberCode =
          cleanMobile.substring(startIndex, subscriberCodeEnd);
      formattedMobile += ' $subscriberCode';

      if (cleanMobile.length > startIndex + 3) {
        String subscriberNumber =
            cleanMobile.substring(startIndex + 3, cleanMobile.length);
        formattedMobile += '-$subscriberNumber';
      }
    }

    // Return the formatted mobile number
    return formattedMobile;
  }

  @override
  String get name => 'England';
}
