part of '../base_mobile_country.dart';

final class VietnamMobileCountry extends MobileCountry {
  static const VietnamMobileCountry instance = VietnamMobileCountry._();
  const VietnamMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^84[0-9]{6,13}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '84';

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
  String get name => 'Vietnam';

  @override
  String get flagAssetName => 'vn.png';
}
