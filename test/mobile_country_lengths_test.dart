import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_helper/mobile_helper.dart';

/// Each country's mobile length and leading digits, as the phone pad uses
/// them: a valid number must pass, typing it digit by digit must never be
/// refused (the pad stops once the number fits and the next digit would
/// not), and a number a digit short or long must fail.
void main() {
  final table = <MobileCountry, List<String>>{
    MalaysiaMobileCountry.instance: [
      '60162374062',
      '601112345678',
      '60193456789',
      '601934567890',
      '601598765432'
    ],
    SingaporeMobileCountry.instance: ['6591234567', '6581234567'],
    PhilippinesMobileCountry.instance: ['639171788612', '639051234567'],
    HongKongMobileCountry.instance: ['85291234567', '85246123456'],
    IndiaMobileCountry.instance: ['919876543210'],
    SriLankaMobileCountry.instance: ['94712345678'],
    ThailandMobileCountry.instance: ['66812345678'],
    ChinaMobileCountry.instance: ['8613812345678'],
    EnglandMobileCountry.instance: ['447700900123'],
    TaiwanMobileCountry.instance: ['886912345678'],
    UnitedStatesMobileCountry.instance: ['12015550123'],
    CanadaMobileCountry.instance: ['14165550123'],
    RussiaMobileCountry.instance: ['79123456789'],
    KazakhstanMobileCountry.instance: ['77011234567'],
    IndonesiaMobileCountry.instance: ['62812345678', '6281234567890'],
    VietnamMobileCountry.instance: ['84912345678'],
    AustraliaMobileCountry.instance: ['61412345678'],
    JapanMobileCountry.instance: ['819012345678'],
    KoreaRepublicOfMobileCountry.instance: ['821012345678'],
    MacaoMobileCountry.instance: ['85366123456'],
    CambodiaMobileCountry.instance: ['85512345678', '855961234567'],
    AnguillaMobileCountry.instance: ['12642351234'],
  };

  for (final entry in table.entries) {
    final country = entry.key;
    for (final mobile in entry.value) {
      test('${country.name} $mobile', () {
        expect(country.checkFormat(mobile), isTrue);
        expect(MobileValidator.getCountryFromMobile(mobile), country);

        var typed = country.code;
        for (var i = country.code.length; i < mobile.length; i++) {
          final next = typed + mobile[i];
          expect(
              country.checkFormat(typed) && !country.checkFormat(next), isFalse,
              reason: 'the pad would stop at $typed');
          typed = next;
        }
      });
    }
  }

  test('a number short or long by a digit fails', () {
    final invalid = <MobileCountry, List<String>>{
      MalaysiaMobileCountry.instance: [
        '6016237406',
        '601623740621',
        '60111234567'
      ],
      PhilippinesMobileCountry.instance: [
        '6391717886',
        '63917178861',
        '6391717886123',
        '63217178861'
      ],
      SingaporeMobileCountry.instance: ['659123456', '65912345678'],
      HongKongMobileCountry.instance: ['85221234567'],
      VietnamMobileCountry.instance: ['8491234567'],
      AustraliaMobileCountry.instance: ['6141234567', '61212345678'],
      JapanMobileCountry.instance: ['81901234567'],
    };
    invalid.forEach((country, mobiles) {
      for (final mobile in mobiles) {
        expect(country.checkFormat(mobile), isFalse,
            reason: '${country.name} $mobile');
      }
    });
  });
}
