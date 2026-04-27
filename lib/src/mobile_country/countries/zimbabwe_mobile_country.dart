part of '../base_mobile_country.dart';

class ZimbabweMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Zimbabwe international format: 263 followed by 9 national digits.
    final zimbabwePattern = RegExp(r'^263[0-9]{9}$');
    return zimbabwePattern.hasMatch(mobile);
  }

  @override
  String get code => '263';

  @override
  String formatMobile(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    if (cleanMobile.isEmpty) {
      return '';
    }
    if (cleanMobile.length <= 3) {
      return cleanMobile;
    }

    final countryCode = cleanMobile.substring(0, 3);
    final subscriberStart = cleanMobile.substring(3, cleanMobile.length > 6 ? 6 : cleanMobile.length);
    var formattedMobile = '($countryCode) $subscriberStart';

    if (cleanMobile.length > 6) {
      formattedMobile += '-${cleanMobile.substring(6)}';
    }

    return formattedMobile;
  }

  @override
  String get name => 'Zimbabwe';

  @override
  String get flagAssetName => 'zw.png';
}
