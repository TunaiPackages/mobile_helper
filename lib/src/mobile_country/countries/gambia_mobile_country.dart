part of '../base_mobile_country.dart';

final class GambiaMobileCountry extends MobileCountry {
  static const GambiaMobileCountry instance = GambiaMobileCountry._();
  const GambiaMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^220(?:[2-79]\d{6}|8[45]\d{5}|8[67]\d{5,7}|8[39]\d{7})$').hasMatch(cleanMobile);
  }

  @override
  String get code => '220';

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
  String get name => 'Gambia';

  @override
  String get flagAssetName => 'gm.png';
}
