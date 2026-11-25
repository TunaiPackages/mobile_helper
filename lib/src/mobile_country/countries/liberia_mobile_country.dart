part of '../base_mobile_country.dart';

final class LiberiaMobileCountry extends MobileCountry {
  static const LiberiaMobileCountry instance = LiberiaMobileCountry._();
  const LiberiaMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^231(?:[2378]\d{8}|4[67]\d{5}|42\d{7}|5[0-46-9]\d{5}|55\d{5,7}|6\d{6})$').hasMatch(cleanMobile);
  }

  @override
  String get code => '231';

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
  String get name => 'Liberia';

  @override
  String get flagAssetName => 'lr.png';
}
