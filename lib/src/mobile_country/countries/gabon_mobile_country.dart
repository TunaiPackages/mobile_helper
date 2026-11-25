part of '../base_mobile_country.dart';

final class GabonMobileCountry extends MobileCountry {
  static const GabonMobileCountry instance = GabonMobileCountry._();
  const GabonMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^241(?:0\d{7}|[2-5]\d{6}|6[0-256]\d{5,6}|6[347-9]\d{5}|7[0-3589]\d{5}|7[467]\d{5,6})$').hasMatch(cleanMobile);
  }

  @override
  String get code => '241';

  @override
  String formatMobile(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    if (cleanMobile.isEmpty || cleanMobile.length <= 3) {
      return cleanMobile;
    }

    final national = cleanMobile.substring(3);
    final firstChunkEnd = national.length > 3 ? 3 : national.length;
    final firstChunk = national.substring(0, firstChunkEnd);
    var formatted = '($code) $firstChunk';

    if (national.length > firstChunkEnd) {
      formatted += '-${national.substring(firstChunkEnd)}';
    }

    return formatted;
  }

  @override
  String get name => 'Gabon';

  @override
  String get flagAssetName => 'ga.png';
}
