part of '../base_mobile_country.dart';

final class EgyptMobileCountry extends MobileCountry {
  static const EgyptMobileCountry instance = EgyptMobileCountry._();
  const EgyptMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^20[0-9]{6,13}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '20';

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
  String get name => 'Egypt';

  @override
  String get flagAssetName => 'eg.png';
}
