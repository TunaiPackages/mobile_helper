import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/mobile_helper.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('MobileValidator', () {
    test('matches countries by prefix and falls back to Other', () {
      expect(
        MobileValidator.getCountryFromMobile('60123456789'),
        isA<MalaysiaMobileCountry>(),
      );
      expect(
        MobileValidator.getCountryFromMobile('263771234567'),
        isA<ZimbabweMobileCountry>(),
      );
      expect(
        MobileValidator.getCountryFromMobile('447123456789'),
        isA<EnglandMobileCountry>(),
      );
      expect(
        MobileValidator.getCountryFromMobile('999123456'),
        isA<OtherMobileCountry>(),
      );
    });

    test('isValid delegates to matched country format check', () {
      expect(MobileValidator.isValid('66812345678'), isTrue);
      expect(MobileValidator.isValid('6612345678'), isFalse);
      expect(MobileValidator.isValid('263771234567'), isTrue);
      expect(MobileValidator.isValid('26377123456'), isFalse);
    });
  });

  group('Country registry', () {
    test('country names are unique', () {
      final names = getMobileCountries().map((country) => country.name).toList();
      expect(names.toSet().length, names.length);
    });

    test('non-empty country codes are unique', () {
      final nonEmptyCodes = getMobileCountries()
          .where((country) => country.code.isNotEmpty)
          .map((country) => country.code)
          .toList();
      expect(nonEmptyCodes.toSet().length, nonEmptyCodes.length);
    });
  });
}
