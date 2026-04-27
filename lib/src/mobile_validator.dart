import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

class MobileValidator {
  static final Set<String> _canadianAreaCodes = {
    '204', '226', '236', '249', '250', '289', '306', '343', '354', '365', '367',
    '368', '382', '387', '403', '416', '418', '428', '431', '437', '438', '450',
    '468', '474', '506', '514', '519', '548', '579', '581', '584', '587', '600',
    '604', '613', '639', '647', '672', '683', '705', '709', '742', '753', '778',
    '780', '782', '807', '819', '825', '867', '873', '879', '902', '905',
  };

  static final MobileCountry _fallbackCountry = getMobileCountries().firstWhere(
    (country) => country.code.isEmpty,
    orElse: () => OtherMobileCountry.instance,
  );

  static final List<MobileCountry> _countriesByCodeLengthDesc =
      getMobileCountries()
          .where((country) => country.code.isNotEmpty)
          .toList()
        ..sort((a, b) => b.code.length.compareTo(a.code.length));

  static MobileCountry getCountryFromMobile(String mobile) {
    final cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
    for (final country in _countriesByCodeLengthDesc) {
      if (country.code.length > 1 && cleanMobile.startsWith(country.code)) {
        return country;
      }
    }

    if (cleanMobile.startsWith('1') && cleanMobile.length >= 4) {
      final areaCode = cleanMobile.substring(1, 4);
      if (_canadianAreaCodes.contains(areaCode)) {
        return CanadaMobileCountry.instance;
      }
      return UnitedStatesMobileCountry.instance;
    }

    for (final country in _countriesByCodeLengthDesc) {
      if (country.code.length == 1 && cleanMobile.startsWith(country.code)) {
        return country;
      }
    }
    return _fallbackCountry;
  }

  static bool isValid(String mobile) {
    final country = getCountryFromMobile(mobile);
    return country.checkFormat(mobile);
  }
}
