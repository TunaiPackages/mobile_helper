import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/mobile_helper.dart';

void main() {
  group('HongKongMobileCountry Tests', () {
    final hongKongMobileCountry = HongKongMobileCountry();

    test('Check valid Hong Kong mobile number format', () {
      expect(hongKongMobileCountry.checkFormat('85291234567'), isTrue);
      expect(hongKongMobileCountry.checkFormat('85261234567'), isTrue);
      expect(hongKongMobileCountry.checkFormat('85251234567'), isTrue);
    });

    test('Check invalid Hong Kong mobile number format', () {
      // Wrong digit after 852 (must be 5, 6, or 9)
      expect(hongKongMobileCountry.checkFormat('85281234567'), isFalse);

      // Wrong length
      expect(hongKongMobileCountry.checkFormat('8529123456'), isFalse);
      expect(hongKongMobileCountry.checkFormat('852912345678'), isFalse);
    });

    test('Format Hong Kong mobile number (ignore leading 852)', () {
      expect(
        hongKongMobileCountry.formatMobile('85291234567'),
        '852 9123 4567',
      );
    });

    test('Format returns original input for invalid input', () {
      expect(
        hongKongMobileCountry.formatMobile('85281234567'),
        '85281234567',
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

