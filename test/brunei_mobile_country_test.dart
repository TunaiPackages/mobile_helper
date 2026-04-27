import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  late BruneiMobileCountry bruneiMobileCountry;

  setUp(() {
    bruneiMobileCountry = BruneiMobileCountry.instance;
  });

  group('BruneiMobileCountry', () {
    test('should return correct country code', () {
      expect(bruneiMobileCountry.code, '673');
    });

    test('should return correct country name', () {
      expect(bruneiMobileCountry.name, 'Brunei');
    });

    group('checkFormat', () {
      test('should return true for valid Brunei numbers', () {
        expect(bruneiMobileCountry.checkFormat('6737123456'), isTrue);
        expect(bruneiMobileCountry.checkFormat('7123456'), isTrue);
      });

      test('should return false for invalid Brunei numbers', () {
        expect(
            bruneiMobileCountry.checkFormat('8123456'), isFalse); // Wrong start
        expect(bruneiMobileCountry.checkFormat('6738123456'),
            isFalse); // Wrong start after 673
        expect(bruneiMobileCountry.checkFormat('123456'), isFalse); // Too short
        expect(bruneiMobileCountry.checkFormat('773456'),
            isFalse); // Too short, wrong format
      });
    });

    group('formatMobile', () {
      test('should format valid local numbers', () {
        expect(bruneiMobileCountry.formatMobile('7123456'), '+6737123456');
      });

      test('should not reformat already correctly formatted numbers', () {
        expect(bruneiMobileCountry.formatMobile('6737123456'), '+6737123456');
      });

      test('should ignore invalid numbers and return as is', () {
        expect(bruneiMobileCountry.formatMobile('8123456'),
            '8123456'); // Invalid number
        expect(
            bruneiMobileCountry.formatMobile('123456'), '123456'); // Too short
      });

      test('should clean non-numeric characters before formatting', () {
        expect(bruneiMobileCountry.formatMobile('7-1 2(34)56'), '+6737123456');
        expect(bruneiMobileCountry.formatMobile('673-712-3456'), '+6737123456');
      });
    });
  });
}
