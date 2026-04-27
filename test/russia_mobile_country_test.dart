import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('RussiaMobileCountry Tests', () {
    final russiaMobileCountry = RussiaMobileCountry.instance;

    test('Check country code', () {
      expect(russiaMobileCountry.code, '7');
    });

    test('Check country name', () {
      expect(russiaMobileCountry.name, 'Russia');
    });

    test('Check valid Russia mobile number format', () {
      expect(russiaMobileCountry.checkFormat('79161234567'), isTrue);
      expect(russiaMobileCountry.checkFormat('+7 916 123 45 67'), isTrue);
    });

    test('Check invalid Russia mobile number format', () {
      expect(russiaMobileCountry.checkFormat('76123456789'), isFalse);
      expect(russiaMobileCountry.checkFormat('77123456789'), isFalse);
      expect(russiaMobileCountry.checkFormat('7916123456'), isFalse);
      expect(russiaMobileCountry.checkFormat('791612345678'), isFalse);
      expect(russiaMobileCountry.checkFormat('8613812345678'), isFalse);
    });

    test('Format Russia mobile number', () {
      expect(russiaMobileCountry.formatMobile('79161234567'), '(7) 916 123-4567');
      expect(
        russiaMobileCountry.formatMobile('+7 916 123 45 67'),
        '(7) 916 123-4567',
      );
    });

    test('Format Russia mobile number with edge lengths', () {
      expect(russiaMobileCountry.formatMobile('7'), '7');
      expect(russiaMobileCountry.formatMobile('79'), '(7) 9');
      expect(russiaMobileCountry.formatMobile('7916'), '(7) 916');
    });

    test('Format empty or invalid input', () {
      expect(russiaMobileCountry.formatMobile(''), '');
      expect(russiaMobileCountry.formatMobile('abc'), '');
    });
  });
}
