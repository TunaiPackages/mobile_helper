part of '../base_mobile_country.dart';

final class GrenadaMobileCountry extends MobileCountry {
  static const GrenadaMobileCountry instance = GrenadaMobileCountry._();
  const GrenadaMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^1473[0-9]{6,11}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '1473';

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
  String get name => 'Grenada';

  @override
  String get flagAssetName => 'gd.png';
}
