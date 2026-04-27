import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('ZimbabweMobileCountry Tests', () {
    final zimbabweMobileCountry = ZimbabweMobileCountry.instance;

    test('check country code and name', () {
      expect(zimbabweMobileCountry.code, '263');
      expect(zimbabweMobileCountry.name, 'Zimbabwe');
    });

    test('check valid Zimbabwe mobile number format', () {
      expect(zimbabweMobileCountry.checkFormat('263771234567'), isTrue);
      expect(zimbabweMobileCountry.checkFormat('263712345678'), isTrue);
    });

    test('check invalid Zimbabwe mobile number format', () {
      expect(zimbabweMobileCountry.checkFormat('26377123456'),
          isFalse); // too short
      expect(zimbabweMobileCountry.checkFormat('2637712345678'),
          isFalse); // too long
      expect(zimbabweMobileCountry.checkFormat('771234567'),
          isFalse); // missing country code
      expect(zimbabweMobileCountry.checkFormat('26A771234567'),
          isFalse); // non-digit
    });

    test('format Zimbabwe mobile number', () {
      expect(zimbabweMobileCountry.formatMobile('263771234567'),
          '(263) 771-234567');
      expect(zimbabweMobileCountry.formatMobile('+263 771 234 567'),
          '(263) 771-234567');
      expect(zimbabweMobileCountry.formatMobile('263'), '263');
      expect(zimbabweMobileCountry.formatMobile(''), '');
    });
  });
}
