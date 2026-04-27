import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('ThailandMobileCountry Tests', () {
    // Create an instance of the ThailandMobileCountry
    final thailandMobileCountry = ThailandMobileCountry();

    test('Check valid Thailand mobile number format', () {
      expect(thailandMobileCountry.checkFormat('66812345678'), isTrue);
    });

    test('Check invalid Thailand mobile number format', () {
      expect(thailandMobileCountry.checkFormat('6612345678'), isFalse);
      expect(thailandMobileCountry.checkFormat('1234567890'), isFalse);
    });

    test('Format Thailand mobile number', () {
      expect(
          thailandMobileCountry.formatMobile('66812345678'), '(66) 812-345678');
    });

    test('Check country code', () {
      expect(thailandMobileCountry.code, '66');
    });

    test('Check country name', () {
      expect(thailandMobileCountry.name, 'Thailand');
    });
  });
}
