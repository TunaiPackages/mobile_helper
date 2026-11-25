part of '../base_mobile_country.dart';

final class SomaliaMobileCountry extends MobileCountry {
  static const SomaliaMobileCountry instance = SomaliaMobileCountry._();
  const SomaliaMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^252(?:1\d{7}|28\d{5}|24\d{6}|[348]\d{8}|6\d{7,8}|7[0-35-9]\d{6,7}|74\d{6}|90\d{6,7}|9[2-9]\d{6})$').hasMatch(cleanMobile);
  }

  @override
  String get code => '252';

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
  String get name => 'Somalia';

  @override
  String get flagAssetName => 'so.png';
}
