part of '../base_mobile_country.dart';

final class SaintVincentAndTheGrenadinesMobileCountry extends MobileCountry {
  static const SaintVincentAndTheGrenadinesMobileCountry instance = SaintVincentAndTheGrenadinesMobileCountry._();
  const SaintVincentAndTheGrenadinesMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^1784[0-9]{6,11}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '1784';

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
  String get name => 'Saint Vincent and the Grenadines';

  @override
  String get flagAssetName => 'vc.png';
}
