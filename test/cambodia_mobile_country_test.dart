import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('CambodiaMobileCountry Tests', () {
    final cambodiaMobileCountry = CambodiaMobileCountry.instance;

    test('Check country code', () {
      expect(cambodiaMobileCountry.code, '855');
    });

    test('Check country name', () {
      expect(cambodiaMobileCountry.name, 'Cambodia');
    });

    test('Check valid Cambodia mobile number format', () {
      expect(cambodiaMobileCountry.checkFormat('85512345678'), isTrue);
      expect(cambodiaMobileCountry.checkFormat('+855 98 123 456'), isTrue);
    });

    test('Check invalid Cambodia mobile number format', () {
      expect(cambodiaMobileCountry.checkFormat('85512345'), isFalse);
      expect(cambodiaMobileCountry.checkFormat('8551234567890123'), isFalse);
      expect(cambodiaMobileCountry.checkFormat('60123456789'), isFalse);
    });

    test('Format Cambodia mobile number', () {
      expect(cambodiaMobileCountry.formatMobile('85512345678'), '(855) 123-45678');
      expect(
        cambodiaMobileCountry.formatMobile('+855 98 123 456'),
        '(855) 981-23456',
      );
    });

    test('Format Cambodia mobile number with edge lengths', () {
      expect(cambodiaMobileCountry.formatMobile('855'), '855');
      expect(cambodiaMobileCountry.formatMobile('8551'), '(855) 1');
      expect(cambodiaMobileCountry.formatMobile('85512'), '(855) 12');
      expect(cambodiaMobileCountry.formatMobile('855123'), '(855) 123');
    });

    test('Format empty or invalid input', () {
      expect(cambodiaMobileCountry.formatMobile(''), '');
      expect(cambodiaMobileCountry.formatMobile('abc'), '');
    });
  });
}
