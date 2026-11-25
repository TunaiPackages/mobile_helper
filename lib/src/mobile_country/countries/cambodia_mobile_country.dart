part of '../base_mobile_country.dart';

final class CambodiaMobileCountry extends MobileCountry {
  static const CambodiaMobileCountry instance = CambodiaMobileCountry._();
  const CambodiaMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^855(?:1[013-79]\d{6}|1[28]\d{6,7}|[2-5]\d{8}|6[016-9]\d{6}|6[2-5]\d{7}|7[07-9]\d{6}|7[1-6]\d{7}|8[013-79]\d{6}|88\d{7}|9[0-589]\d{6}|97\d{6,7}|96\d{7})$').hasMatch(cleanMobile);
  }

  @override
  String get code => '855';

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
  String get name => 'Cambodia';

  @override
  String get flagAssetName => 'kh.png';
}
