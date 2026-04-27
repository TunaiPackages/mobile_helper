part of '../base_mobile_country.dart';

final class OtherMobileCountry extends MobileCountry {
  static const OtherMobileCountry instance = OtherMobileCountry._();
  const OtherMobileCountry._();
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
  String get flagAssetName => '';
}
