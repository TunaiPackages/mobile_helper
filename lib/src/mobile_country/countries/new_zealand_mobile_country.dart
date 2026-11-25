part of '../base_mobile_country.dart';

final class NewZealandMobileCountry extends MobileCountry {
  static const NewZealandMobileCountry instance = NewZealandMobileCountry._();
  const NewZealandMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^64(?:2[17]\d{6,8}|26\d{6,7}|2[0289]\d{7,8})$').hasMatch(cleanMobile);
  }

  @override
  String get code => '64';

  @override
  String formatMobile(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    if (cleanMobile.isEmpty || cleanMobile.length <= 2) {
      return cleanMobile;
    }

    final national = cleanMobile.substring(2);
    final firstChunkEnd = national.length > 3 ? 3 : national.length;
    final firstChunk = national.substring(0, firstChunkEnd);
    var formatted = '($code) $firstChunk';

    if (national.length > firstChunkEnd) {
      formatted += '-${national.substring(firstChunkEnd)}';
    }

    return formatted;
  }

  @override
  String get name => 'New Zealand';

  @override
  String get flagAssetName => 'nz.png';
}
