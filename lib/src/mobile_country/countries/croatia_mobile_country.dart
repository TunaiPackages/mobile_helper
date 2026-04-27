part of '../base_mobile_country.dart';

final class CroatiaMobileCountry extends MobileCountry {
  static const CroatiaMobileCountry instance = CroatiaMobileCountry._();
  const CroatiaMobileCountry._();
  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^385[0-9]{6,12}$').hasMatch(cleanMobile);
  }

  @override
  String get code => '385';

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
  String get name => 'Croatia';

  @override
  String get flagAssetName => 'hr.png';
}
