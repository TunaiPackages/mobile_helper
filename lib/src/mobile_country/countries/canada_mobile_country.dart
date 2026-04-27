part of '../base_mobile_country.dart';

final class CanadaMobileCountry extends MobileCountry {
  static const CanadaMobileCountry instance = CanadaMobileCountry._();
  const CanadaMobileCountry._();

  static const Set<String> _canadianAreaCodes = {
    '204', '226', '236', '249', '250', '289', '306', '343', '354', '365', '367',
    '368', '382', '387', '403', '416', '418', '428', '431', '437', '438', '450',
    '468', '474', '506', '514', '519', '548', '579', '581', '584', '587', '600',
    '604', '613', '639', '647', '672', '683', '705', '709', '742', '753', '778',
    '780', '782', '807', '819', '825', '867', '873', '879', '902', '905',
  };

  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    if (!RegExp(r'^1[2-9][0-9]{9}$').hasMatch(cleanMobile)) {
      return false;
    }
    return _canadianAreaCodes.contains(cleanMobile.substring(1, 4));
  }

  @override
  String get code => '1';

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
  String get name => 'Canada';

  @override
  String get flagAssetName => 'ca.png';
}
