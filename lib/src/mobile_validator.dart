import 'package:mobile_helper/src/mobile_country/base_mobile_country.dart';

class MobileValidator {
  static MobileCountry? getCountryFromMobile(String mobile) {
    //MY
    if (mobile.startsWith(MalaysiaMobileCountry().code)) {
      return MalaysiaMobileCountry();
    }

    //SG
    else if (mobile.startsWith(SingaporeMobileCountry().code)) {
      return SingaporeMobileCountry();
    }

    //Brunei
    else if (mobile.startsWith(BruneiMobileCountry().code)) {
      return BruneiMobileCountry();
    }

    //HongKong
    else if (mobile.startsWith(HongKongMobileCountry().code)) {
      return HongKongMobileCountry();
    }

    //Indonesia
    else if (mobile.startsWith(IndonesiaMobileCountry().code)) {
      return IndonesiaMobileCountry();
    }

    //Philippines
    else if (mobile.startsWith(PhilippinesMobileCountry().code)) {
      return PhilippinesMobileCountry();
    }

    //India
    else if (mobile.startsWith(IndiaMobileCountry().code)) {
      return IndiaMobileCountry();
    }

    //Sri Lanka
    else if (mobile.startsWith(SriLankaMobileCountry().code)) {
      return SriLankaMobileCountry();
    }

    //Thailand
    else if (mobile.startsWith(ThailandMobileCountry().code)) {
      return ThailandMobileCountry();
    }

    //England
    else if (mobile.startsWith(EnglandMobileCountry().code)) {
      return EnglandMobileCountry();
    }

    //Taiwan
    else if (mobile.startsWith(TaiwanMobileCountry().code)) {
      return TaiwanMobileCountry();
    }

    //default
    return null;
  }

  static bool isValid(String mobile) {
    MobileCountry? country = getCountryFromMobile(mobile);
    if (country != null) {
      return country.checkFormat(mobile);
    }

    return mobile.length > 6;
  }
}
