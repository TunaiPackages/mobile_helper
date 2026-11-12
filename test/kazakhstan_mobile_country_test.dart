import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('KazakhstanMobileCountry Tests', () {
    final kazakhstanMobileCountry = KazakhstanMobileCountry.instance;

    test('Check country code', () {
      expect(kazakhstanMobileCountry.code, '7');
    });

    test('Check country name', () {
      expect(kazakhstanMobileCountry.name, 'Kazakhstan');
    });

    test('Check valid Kazakhstan mobile number format', () {
      expect(kazakhstanMobileCountry.checkFormat('77017432605'), isTrue);
      expect(kazakhstanMobileCountry.checkFormat('+7 701 743 26 05'), isTrue);
      expect(kazakhstanMobileCountry.checkFormat('76123456789'), isTrue);
    });

    test('Check invalid Kazakhstan mobile number format', () {
      expect(kazakhstanMobileCountry.checkFormat('79161234567'), isFalse);
      expect(kazakhstanMobileCountry.checkFormat('7701743260'), isFalse);
      expect(kazakhstanMobileCountry.checkFormat('770174326051'), isFalse);
    });

    test('Format Kazakhstan mobile number', () {
      expect(
        kazakhstanMobileCountry.formatMobile('77017432605'),
        '(7) 701 743-2605',
      );
      expect(
        kazakhstanMobileCountry.formatMobile('+7 701 743 26 05'),
        '(7) 701 743-2605',
      );
    });

    test('Format Kazakhstan mobile number with edge lengths', () {
      expect(kazakhstanMobileCountry.formatMobile('7'), '7');
      expect(kazakhstanMobileCountry.formatMobile('77'), '(7) 7');
      expect(kazakhstanMobileCountry.formatMobile('7701'), '(7) 701');
    });

    test('Typing after the prefilled code reaches the 77 range', () {
      // The keypad prefills the code and appends what the user types.
      final typed = '${kazakhstanMobileCountry.code}7017432605';
      expect(kazakhstanMobileCountry.checkFormat(typed), isTrue);
    });
  });
}
