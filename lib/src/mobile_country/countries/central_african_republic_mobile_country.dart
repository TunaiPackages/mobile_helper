part of '../base_mobile_country.dart';

final class CentralAfricanRepublicMobileCountry extends MobileCountry {
  static const CentralAfricanRepublicMobileCountry instance = CentralAfricanRepublicMobileCountry._();
  const CentralAfricanRepublicMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^236[0-9]{6,12}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '236';

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
  String get name => 'Central African Republic';

  @override
  String get flagAssetName => 'cf.png';
}
