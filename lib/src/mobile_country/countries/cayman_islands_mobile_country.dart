part of '../base_mobile_country.dart';

final class CaymanIslandsMobileCountry extends MobileCountry {
  static const CaymanIslandsMobileCountry instance = CaymanIslandsMobileCountry._();
  const CaymanIslandsMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^1345[0-9]{6,11}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '1345';

  @override
  String formatMobile(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    if (cleanMobile.isEmpty || cleanMobile.length <= 4) {
      return cleanMobile;
    }

    final national = cleanMobile.substring(4);
    final firstChunkEnd = national.length > 3 ? 3 : national.length;
    final firstChunk = national.substring(0, firstChunkEnd);
    var formatted = '($code) $firstChunk';

    if (national.length > firstChunkEnd) {
      formatted += '-${national.substring(firstChunkEnd)}';
    }

    return formatted;
  }

  @override
  String get name => 'Cayman Islands';

  @override
  String get flagAssetName => 'ky.png';
}
