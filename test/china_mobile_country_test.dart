import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('ChinaMobileCountry Tests', () {
    // Create an instance of the ChinaMobileCountry
    final chinaMobileCountry = ChinaMobileCountry();

    test('Check valid China mobile number format', () {
      expect(chinaMobileCountry.checkFormat('8613812345678'), isTrue);
      expect(chinaMobileCountry.checkFormat('8615987654321'), isTrue);
      expect(chinaMobileCountry.checkFormat('8618123456789'), isTrue);
      expect(chinaMobileCountry.checkFormat('8619876543210'), isTrue);
    });

    test('Check invalid China mobile number format', () {
      // Wrong country code
      expect(chinaMobileCountry.checkFormat('6612345678'), isFalse);
      expect(chinaMobileCountry.checkFormat('1234567890'), isFalse);
      
      // Wrong length
      expect(chinaMobileCountry.checkFormat('861234567'), isFalse);
      expect(chinaMobileCountry.checkFormat('86123456789012'), isFalse);
      
      // Wrong mobile prefix (first digit after 86 must be 1)
      expect(chinaMobileCountry.checkFormat('8623456789012'), isFalse);
      expect(chinaMobileCountry.checkFormat('8603456789012'), isFalse);
      
      // Wrong second digit (must be 3-9)
      expect(chinaMobileCountry.checkFormat('8610123456789'), isFalse);
      expect(chinaMobileCountry.checkFormat('8611123456789'), isFalse);
      expect(chinaMobileCountry.checkFormat('8612123456789'), isFalse);
    });

    test('Format China mobile number', () {
      expect(
          chinaMobileCountry.formatMobile('8613812345678'), '(86) 138-12345678');
      expect(
          chinaMobileCountry.formatMobile('8615987654321'), '(86) 159-87654321');
    });

    test('Format China mobile number with different lengths', () {
      expect(chinaMobileCountry.formatMobile('86'), '(86)');
      expect(chinaMobileCountry.formatMobile('861'), '(86) 1');
      expect(chinaMobileCountry.formatMobile('8613'), '(86) 13');
      expect(chinaMobileCountry.formatMobile('86138'), '(86) 138');
      expect(chinaMobileCountry.formatMobile('861381'), '(86) 138-1');
    });

    test('Format China mobile number with non-digit characters', () {
      expect(chinaMobileCountry.formatMobile('86-138-1234-5678'), 
          '(86) 138-12345678');
      expect(chinaMobileCountry.formatMobile('+86 138 1234 5678'), 
          '(86) 138-12345678');
      expect(chinaMobileCountry.formatMobile('86.138.1234.5678'), 
          '(86) 138-12345678');
    });

    test('Format empty or invalid input', () {
      expect(chinaMobileCountry.formatMobile(''), '');
      expect(chinaMobileCountry.formatMobile('a'), '');
      expect(chinaMobileCountry.formatMobile('abc'), '');
    });

    test('Check country code', () {
      expect(chinaMobileCountry.code, '86');
    });

    test('Check country name', () {
      expect(chinaMobileCountry.name, 'China');
    });
  });
}