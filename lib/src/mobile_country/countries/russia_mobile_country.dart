part of '../base_mobile_country.dart';

final class RussiaMobileCountry extends MobileCountry {
  static const RussiaMobileCountry instance = RussiaMobileCountry._();
  const RussiaMobileCountry._();

  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    // Russia and Kazakhstan share +7. Route 76/77 prefixes to Kazakhstan.
    if (cleanMobile.startsWith('76') || cleanMobile.startsWith('77')) {
      return false;
    }
    return RegExp(r'^7[0-9]{10}$').hasMatch(cleanMobile);
  }

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
      final secondChunkEnd =
          national.length > firstChunkEnd + 3 ? firstChunkEnd + 3 : national.length;
      formatted += ' ${national.substring(firstChunkEnd, secondChunkEnd)}';
      if (national.length > secondChunkEnd) {
        formatted += '-${national.substring(secondChunkEnd)}';
      }
    }

    return formatted;
  }

  @override
  String get name => 'Russia';

  @override
  String get flagAssetName => 'ru.png';
}
