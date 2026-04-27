part of '../base_mobile_country.dart';

final class UnitedStatesMobileCountry extends MobileCountry {
  static const UnitedStatesMobileCountry instance = UnitedStatesMobileCountry._();
  const UnitedStatesMobileCountry._();

  @override
  bool checkFormat(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    return RegExp(r'^1[2-9][0-9]{9}$').hasMatch(cleanMobile);
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
    final areaEnd = national.length > 3 ? 3 : national.length;
    final area = national.substring(0, areaEnd);
    var formatted = '($code) $area';

    if (national.length > areaEnd) {
      final prefixEnd = national.length > areaEnd + 3 ? areaEnd + 3 : national.length;
      formatted += ' ${national.substring(areaEnd, prefixEnd)}';
      if (national.length > prefixEnd) {
        formatted += '-${national.substring(prefixEnd)}';
      }
    }

    return formatted;
  }

  @override
  String get name => 'United States';

  @override
  String get flagAssetName => 'us.png';
}
