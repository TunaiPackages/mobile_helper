import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

void main() {
  group('CanadaMobileCountry Tests', () {
    final canadaMobileCountry = CanadaMobileCountry.instance;

    test('Check country code', () {
      expect(canadaMobileCountry.code, '1');
    });

    test('Check country name', () {
      expect(canadaMobileCountry.name, 'Canada');
    });

    test('Check valid Canada mobile number format', () {
      expect(canadaMobileCountry.checkFormat('14165550123'), isTrue);
      expect(canadaMobileCountry.checkFormat('+1 604 555 0123'), isTrue);
    });

    test('Check invalid Canada mobile number format', () {
      expect(canadaMobileCountry.checkFormat('12025550123'), isFalse);
      expect(canadaMobileCountry.checkFormat('11025550123'), isFalse);
      expect(canadaMobileCountry.checkFormat('1416555012'), isFalse);
      expect(canadaMobileCountry.checkFormat('141655501234'), isFalse);
    });

    test('Format Canada mobile number', () {
      expect(canadaMobileCountry.formatMobile('14165550123'), '(1) 416-5550123');
      expect(
        canadaMobileCountry.formatMobile('+1 604 555 0123'),
        '(1) 604-5550123',
      );
    });
  });
}
