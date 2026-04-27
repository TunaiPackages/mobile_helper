import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';
import 'package:mobile_helper/src/mobile_validator.dart';

void main() {
  group('Additional mobile countries', () {
    test('all additional countries are registered explicitly', () {
      final countries = getMobileCountries();
      expect(countries.where((c) => c is OtherMobileCountry).length, 1);
      expect(countries.length, 231);
      expect(countries.any((c) => c.name == 'Nigeria' && c.code == '234'), isTrue);
      expect(countries.any((c) => c.name == 'Canada' && c.code == '1'), isTrue);
      expect(countries.any((c) => c.name == 'United States' && c.code == '1'), isTrue);
      expect(countries.any((c) => c.name == 'Japan' && c.code == '81'), isTrue);
    });

    test('longest-prefix routing still works', () {
      final americanSamoa = MobileValidator.getCountryFromMobile('16845551234');
      final usaOrCanada = MobileValidator.getCountryFromMobile('12025550123');
      expect(americanSamoa.code, '1684');
      expect(usaOrCanada.code, '1');
    });
  });
}
