import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('EnglandMobileCountry Tests', () {
    // Create an instance of the EnglandMobileCountry
    final englandMobileCountry = EnglandMobileCountry();

    test('Check valid England mobile number format', () {
      expect(englandMobileCountry.checkFormat('447123456789'), isTrue);
      expect(englandMobileCountry.checkFormat('07123456789'), isTrue);
    });

    test('Check invalid England mobile number format', () {
      expect(englandMobileCountry.checkFormat('44123456789'), isFalse);
      expect(englandMobileCountry.checkFormat('1234567890'), isFalse);
    });

    test('Format England mobile number', () {
      expect(englandMobileCountry.formatMobile('447123456789'),
          '(44) 712-3456789');
    });

    test('Check country code', () {
      expect(englandMobileCountry.code, '44');
    });

    test('Check country name', () {
      expect(englandMobileCountry.name, 'England');
    });
  });
}
