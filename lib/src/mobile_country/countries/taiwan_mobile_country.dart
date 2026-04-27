part of '../base_mobile_country.dart';

final class TaiwanMobileCountry extends MobileCountry {
  static const TaiwanMobileCountry instance = TaiwanMobileCountry._();
  const TaiwanMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    // Regular expression to match Taiwan mobile numbers.
    // Taiwan mobile numbers typically start with 886 followed by 9 digits.
    RegExp taiwanPattern = RegExp(r'^886[0-9]{9}$');

    // Check if the provided mobile number matches the Taiwan pattern.
    return taiwanPattern.hasMatch(mobile);
  }

  @override
  String get code => '886';

  @override
  String formatMobile(String mobile) {
    // Remove any non-digit characters from the mobile number
    String cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned mobile number is empty
    if (cleanMobile.isEmpty) {
      return '';
    } else if (cleanMobile.length < 3) {
      return cleanMobile;
    }

    // Extract the parts of the mobile number
    String countryCode =
        cleanMobile.substring(0, 3); // Use only 3 digits for country code
    String formattedMobile = '($countryCode)';

    if (cleanMobile.length > 3) {
      int end = cleanMobile.length > 6 ? 6 : cleanMobile.length;

      String subscriberCode = cleanMobile.substring(3, end);
      formattedMobile += ' $subscriberCode';

      if (cleanMobile.length > 6) {
        String subscriberNumber = cleanMobile.substring(6, cleanMobile.length);
        formattedMobile += '-$subscriberNumber';
      }
    }

    // Return the formatted mobile number
    return formattedMobile;
  }

  @override
  String get name => 'Taiwan';

  @override
  String get flagAssetName => 'tw.png';
}
