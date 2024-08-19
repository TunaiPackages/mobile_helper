part of '../base_mobile_country.dart';

class MalaysiaMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Malaysian mobile numbers.
    // Malaysian mobile numbers typically start with 01X or 01Y followed by 7 digits.
    // Additionally, if the number starts with 6011, it should have 11 digits in total.
    RegExp malaysiaPattern =
        RegExp(r'^(601(?!1)[0-9]{1}[0-9]{7}|6011[0-9]{8})$');

    // Check if the provided mobile number matches the Malaysian pattern.
    return malaysiaPattern.hasMatch(mobile);
  }

  @override
  String get code => '60';

  @override
  String formatMobile(String mobile) {
    // Remove any non-digit characters from the mobile number
    String cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned mobile number is empty
    if (cleanMobile.isEmpty) {
      return '';
    } else if (cleanMobile.length < 4) {
      return cleanMobile;
    }

    // Extract the parts of the mobile number
    String countryCode = cleanMobile.substring(0, 4);
    String formattedMobile = '($countryCode';

    if (cleanMobile.length >= 4) {
      formattedMobile += ')';

      int end = cleanMobile.length > 7 ? 7 : cleanMobile.length;

      String subscriberCode = cleanMobile.substring(4, end);
      formattedMobile += ' $subscriberCode';

      if (cleanMobile.length >= 7) {
        String subscriberNumber = cleanMobile.substring(7, cleanMobile.length);
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
  String get name => 'Malaysia';
}
