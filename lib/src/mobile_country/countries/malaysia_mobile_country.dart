part of '../base_mobile_country.dart';

final class MalaysiaMobileCountry extends MobileCountry {
  static const MalaysiaMobileCountry instance = MalaysiaMobileCountry._();
  const MalaysiaMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    // Malaysian mobiles are 01X plus seven digits (nine national digits),
    // except 011, which always has eight, and 015, 018 and 019, which now
    // have numbers with seven or eight (MCMC plan, as in libphonenumber).
    RegExp malaysiaPattern =
        RegExp(r'^60(?:1[02-467]\d{7}|11\d{8}|1[589]\d{7,8})$');

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

  @override
  String get flagAssetName => 'my.png';
}
