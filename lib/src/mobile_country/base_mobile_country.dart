part 'countries/brunei_mobile_country.dart';
part 'countries/indonesia_mobile_country.dart';
part 'countries/malaysia_mobile_country.dart';
part 'countries/singapore_mobile_country.dart';
part 'countries/philippines_mobile_country.dart';
part 'countries/hong_kong_mobile_country.dart';
part 'countries/india_mobile_country.dart';
part 'countries/sri_lanka_mobile_country.dart';

sealed class MobileCountry {
  String get name;
  String get code;
  bool checkFormat(String mobile);
  String formatMobile(String mobile);
}

List<MobileCountry> getMobileCountries() {
  return [
    MalaysiaMobileCountry(),
    SingaporeMobileCountry(),
    BruneiMobileCountry(),
    IndonesiaMobileCountry(),
    PhilippinesMobileCountry(),
    HongKongMobileCountry(),
    IndiaMobileCountry(),
    SriLankaMobileCountry(),
  ];
}
