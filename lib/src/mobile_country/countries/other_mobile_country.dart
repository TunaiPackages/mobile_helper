part of '../base_mobile_country.dart';

class OtherMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    return mobile.length > 6;
  }

  @override
  String get code => '';

  @override
  String formatMobile(String mobile) {
    return mobile;
  }

  @override
  String get name => 'Other';

  @override
  String get flagAssetName => 'zw.png';
}
