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
        MobileValidator.getCountryFromMobile('14165550123'),
        same(CanadaMobileCountry.instance),
      );
      expect(
        MobileValidator.getCountryFromMobile('12025550123'),
        same(UnitedStatesMobileCountry.instance),
      );
      expect(
        MobileValidator.getCountryFromMobile('85598123456'),
        same(CambodiaMobileCountry.instance),
      );
      expect(
        MobileValidator.getCountryFromMobile('8562091234567'),
        same(LaoPeopleSDemocraticRepublicMobileCountry.instance),
      );
      expect(
        MobileValidator.getCountryFromMobile('76123456789'),
        same(KazakhstanMobileCountry.instance),
      );
      expect(
        MobileValidator.getCountryFromMobile('79161234567'),
        same(RussiaMobileCountry.instance),
      );
      expect(
        MobileValidator.getCountryFromMobile('999123456'),
        isA<OtherMobileCountry>(),
      );
    });

    test('isValid delegates to matched country format check', () {
      expect(MobileValidator.isValid('66812345678'), isTrue);
      expect(MobileValidator.isValid('6612345678'), isFalse);
      expect(MobileValidator.isValid('14165550123'), isTrue);
      expect(MobileValidator.isValid('12025550123'), isTrue);
      expect(MobileValidator.isValid('11025550123'), isFalse);
      expect(MobileValidator.isValid('85598123456'), isTrue);
      expect(MobileValidator.isValid('85512345'), isFalse);
      expect(MobileValidator.isValid('8562091234567'), isTrue);
      expect(MobileValidator.isValid('85612345'), isFalse);
      expect(MobileValidator.isValid('263771234567'), isTrue);
      expect(MobileValidator.isValid('26377123456'), isFalse);
      expect(MobileValidator.isValid('79161234567'), isTrue);
      expect(MobileValidator.isValid('76123456789'), isTrue);
      expect(MobileValidator.isValid('77123456789'), isFalse);
    });
  });

  group('Country registry', () {
    test('country names are unique', () {
      final names = getMobileCountries().map((country) => country.name).toList();
      expect(names.toSet().length, names.length);
    });

    test('non-empty country codes are unique except NANP shared code', () {
      final nonEmptyCodes = getMobileCountries()
          .where((country) => country.code.isNotEmpty)
          .map((country) => country.code)
          .toList();
      final codeCounts = <String, int>{};
      for (final code in nonEmptyCodes) {
        codeCounts.update(code, (count) => count + 1, ifAbsent: () => 1);
      }

      expect(codeCounts['1'], 2);
      final duplicatedNonNanpCodes = codeCounts.entries
          .where((entry) => entry.key != '1' && entry.value > 1)
          .toList();
      expect(duplicatedNonNanpCodes, isEmpty);
    });
  });
}
