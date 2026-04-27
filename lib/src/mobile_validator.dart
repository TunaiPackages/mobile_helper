import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

class MobileValidator {
  static final MobileCountry _fallbackCountry = getMobileCountries().firstWhere(
    (country) => country.code.isEmpty,
    orElse: OtherMobileCountry.new,
  );

  static final List<MobileCountry> _countriesByCodeLengthDesc =
      getMobileCountries()
          .where((country) => country.code.isNotEmpty)
          .toList()
        ..sort((a, b) => b.code.length.compareTo(a.code.length));

  static MobileCountry getCountryFromMobile(String mobile) {
    for (final country in _countriesByCodeLengthDesc) {
      if (mobile.startsWith(country.code)) {
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
