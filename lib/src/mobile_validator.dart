import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

class MobileValidator {
  static bool isValid(String mobile) {
    //MY
    if (mobile.startsWith(MalaysiaMobileCountry().code)) {
      return MalaysiaMobileCountry().checkFormat(mobile);
    }

    //SG
    else if (mobile.startsWith(SingaporeMobileCountry().code)) {
      return SingaporeMobileCountry().checkFormat(mobile);
    }

    //Brunei
    else if (mobile.startsWith(BruneiMobileCountry().code)) {
      return BruneiMobileCountry().checkFormat(mobile);
    }

    //HongKong
    else if (mobile.startsWith(HongKongMobileCountry().code)) {
      return HongKongMobileCountry().checkFormat(mobile);
    }

    //Indonesia
    else if (mobile.startsWith(IndonesiaMobileCountry().code)) {
      return IndonesiaMobileCountry().checkFormat(mobile);
    }

    //Philippines
    else if (mobile.startsWith(PhilippinesMobileCountry().code)) {
      return PhilippinesMobileCountry().checkFormat(mobile);
    }

    //default
    return mobile.length > 6;
  }
}
