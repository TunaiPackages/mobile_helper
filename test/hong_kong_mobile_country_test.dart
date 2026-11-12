import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('HongKongMobileCountry Tests', () {
    final hongKongMobileCountry = HongKongMobileCountry.instance;

    test('Check valid Hong Kong mobile number format', () {
      expect(hongKongMobileCountry.checkFormat('85291234567'), isTrue);
      expect(hongKongMobileCountry.checkFormat('85261234567'), isTrue);
      expect(hongKongMobileCountry.checkFormat('85251234567'), isTrue);
    });

    test('Check Hong Kong mobile numbers starting with 4, 7 or 8', () {
      // OFCA mobile blocks, e.g. 8490 0000-8499 9999 (China Mobile HK).
      expect(hongKongMobileCountry.checkFormat('85284906043'), isTrue);
      expect(hongKongMobileCountry.checkFormat('85246123456'), isTrue);
      expect(hongKongMobileCountry.checkFormat('85270123456'), isTrue);
    });

    test('Check invalid Hong Kong mobile number format', () {
      // Fixed lines and other non-mobile ranges (must be 4 to 9)
      expect(hongKongMobileCountry.checkFormat('85211234567'), isFalse);
      expect(hongKongMobileCountry.checkFormat('85221234567'), isFalse);
      expect(hongKongMobileCountry.checkFormat('85231234567'), isFalse);

      // Wrong length
      expect(hongKongMobileCountry.checkFormat('8529123456'), isFalse);
      expect(hongKongMobileCountry.checkFormat('852912345678'), isFalse);
      expect(hongKongMobileCountry.checkFormat('8528490604'), isFalse);
      expect(hongKongMobileCountry.checkFormat('852849060431'), isFalse);
    });

    test('Format Hong Kong mobile number (ignore leading 852)', () {
      expect(
        hongKongMobileCountry.formatMobile('85291234567'),
        '852 9123 4567',
      );
      expect(
        hongKongMobileCountry.formatMobile('85284906043'),
        '852 8490 6043',
      );
    });

    test('Format returns original input for invalid input', () {
      expect(
        hongKongMobileCountry.formatMobile('85221234567'),
        '85221234567',
      );
    });

    test('Check country code', () {
      expect(hongKongMobileCountry.code, '852');
    });

    test('Check country name', () {
      expect(hongKongMobileCountry.name, 'Hong Kong');
    });
  });
}
