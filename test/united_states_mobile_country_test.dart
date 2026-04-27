import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('UnitedStatesMobileCountry Tests', () {
    final unitedStatesMobileCountry = UnitedStatesMobileCountry.instance;

    test('Check country code', () {
      expect(unitedStatesMobileCountry.code, '1');
    });

    test('Check country name', () {
      expect(unitedStatesMobileCountry.name, 'United States');
    });

    test('Check valid United States mobile number format', () {
      expect(unitedStatesMobileCountry.checkFormat('12025550123'), isTrue);
      expect(unitedStatesMobileCountry.checkFormat('+1 310 555 0123'), isTrue);
    });

    test('Check invalid United States mobile number format', () {
      expect(unitedStatesMobileCountry.checkFormat('11025550123'), isFalse);
      expect(unitedStatesMobileCountry.checkFormat('1202555012'), isFalse);
      expect(unitedStatesMobileCountry.checkFormat('120255501234'), isFalse);
      expect(unitedStatesMobileCountry.checkFormat('60123456789'), isFalse);
    });

    test('Format United States mobile number', () {
      expect(
        unitedStatesMobileCountry.formatMobile('12025550123'),
        '(1) 202 555-0123',
      );
      expect(
        unitedStatesMobileCountry.formatMobile('+1 310 555 0123'),
        '(1) 310 555-0123',
      );
    });
  });
}
