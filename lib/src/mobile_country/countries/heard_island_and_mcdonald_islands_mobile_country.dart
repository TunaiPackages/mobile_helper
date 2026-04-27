part of '../base_mobile_country.dart';

class HeardIslandAndMcdonaldIslandsMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^0[0-9]{6,14}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '0';

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
      formatted += '-${national.substring(firstChunkEnd)}';
    }

    return formatted;
  }

  @override
  String get name => 'Heard Island and McDonald Islands';

  @override
  String get flagAssetName => 'hm.png';
}
