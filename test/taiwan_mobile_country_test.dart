import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('TaiwanMobileCountry Tests', () {
    // Create an instance of the TaiwanMobileCountry
    final taiwanMobileCountry = TaiwanMobileCountry.instance;

    test('Check valid Taiwan mobile number format', () {
      expect(taiwanMobileCountry.checkFormat('886912345678'), isTrue);
    });

    test('Check invalid Taiwan mobile number format', () {
      expect(taiwanMobileCountry.checkFormat('8812345678'), isFalse);
      expect(taiwanMobileCountry.checkFormat('1234567890'), isFalse);
    });

    test('Format Taiwan mobile number', () {
      expect(
          taiwanMobileCountry.formatMobile('886912345678'), '(886) 912-345678');
    });

    test('Check country code', () {
      expect(taiwanMobileCountry.code, '886');
    });

    test('Check country name', () {
      expect(taiwanMobileCountry.name, 'Taiwan');
    });
  });
}
