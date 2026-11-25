part of '../base_mobile_country.dart';

final class ItalyMobileCountry extends MobileCountry {
  static const ItalyMobileCountry instance = ItalyMobileCountry._();
  const ItalyMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^39(?:3[2-9]\d{7,8}|31\d{8}|4\d{9})$').hasMatch(cleanMobile);
  }

  @override
  String get code => '39';

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
  String get name => 'Italy';

  @override
  String get flagAssetName => 'it.png';
}
