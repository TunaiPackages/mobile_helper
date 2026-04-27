import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('LaoPeopleSDemocraticRepublicMobileCountry Tests', () {
    final laosMobileCountry = LaoPeopleSDemocraticRepublicMobileCountry.instance;

    test('Check country code', () {
      expect(laosMobileCountry.code, '856');
    });

    test('Check country name', () {
      expect(laosMobileCountry.name, 'Lao People\'s Democratic Republic');
    });

    test('Check valid Laos mobile number format', () {
      expect(laosMobileCountry.checkFormat('8562091234567'), isTrue);
      expect(laosMobileCountry.checkFormat('+856 20 9123 4567'), isTrue);
    });

    test('Check invalid Laos mobile number format', () {
      expect(laosMobileCountry.checkFormat('85612345'), isFalse);
      expect(laosMobileCountry.checkFormat('8561234567890123'), isFalse);
      expect(laosMobileCountry.checkFormat('85598123456'), isFalse);
    });

    test('Format Laos mobile number', () {
      expect(laosMobileCountry.formatMobile('8562091234567'), '(856) 209-1234567');
      expect(
        laosMobileCountry.formatMobile('+856 20 9123 4567'),
        '(856) 209-1234567',
      );
    });

    test('Format Laos mobile number with edge lengths', () {
      expect(laosMobileCountry.formatMobile('856'), '856');
      expect(laosMobileCountry.formatMobile('8562'), '(856) 2');
      expect(laosMobileCountry.formatMobile('85620'), '(856) 20');
      expect(laosMobileCountry.formatMobile('856209'), '(856) 209');
    });

    test('Format empty or invalid input', () {
      expect(laosMobileCountry.formatMobile(''), '');
      expect(laosMobileCountry.formatMobile('abc'), '');
    });
  });
}
