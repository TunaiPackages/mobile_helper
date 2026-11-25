part of '../base_mobile_country.dart';

final class NicaraguaMobileCountry extends MobileCountry {
  static const NicaraguaMobileCountry instance = NicaraguaMobileCountry._();
  const NicaraguaMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^505[5-8]\d{7}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '505';

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
  String get name => 'Nicaragua';

  @override
  String get flagAssetName => 'ni.png';
}
