part of '../base_mobile_country.dart';

final class KazakhstanMobileCountry extends MobileCountry {
  static const KazakhstanMobileCountry instance = KazakhstanMobileCountry._();
  const KazakhstanMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^7(6|7)[0-9]{9}$').hasMatch(cleanMobile);
  }

  // Kazakhstan shares +7 with Russia; its numbers are the 76/77 range.
  @override
  String get code => '7';

  @override
  String formatMobile(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    if (cleanMobile.isEmpty || cleanMobile.length <= 1) {
      return cleanMobile;
    }

    final national = cleanMobile.substring(1);
    final firstChunkEnd = national.length > 3 ? 3 : national.length;
    final firstChunk = national.substring(0, firstChunkEnd);
    var formatted = '($code) $firstChunk';

    if (national.length > firstChunkEnd) {
      final secondChunkEnd = national.length > firstChunkEnd + 3
          ? firstChunkEnd + 3
          : national.length;
      formatted += ' ${national.substring(firstChunkEnd, secondChunkEnd)}';
      if (national.length > secondChunkEnd) {
        formatted += '-${national.substring(secondChunkEnd)}';
      }
    }

    return formatted;
  }

  @override
  String get name => 'Kazakhstan';

  @override
  String get flagAssetName => 'kz.png';
}
