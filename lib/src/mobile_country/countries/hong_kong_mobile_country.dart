part of '../base_mobile_country.dart';

class HongKongMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Hong Kong mobile numbers typically start with the country code 852 and are followed by 8 digits that start with 5, 6, or 9
    final RegExp hkMobilePattern = RegExp(r'^852[569]\d{7}$');
    return hkMobilePattern.hasMatch(mobile);
  }

  @override
  String get code => '+852'; // Hong Kong country code

  @override
  String formatMobile(String mobile) {
    // Format the mobile number to include the country code
    // For example, '91234567' becomes '+852 9123 4567'
    if (checkFormat(mobile)) {
      return '$code ${mobile.substring(0, 4)} ${mobile.substring(4)}';
    } else {
      throw FormatException("Invalid Hong Kong mobile number format");
    }
  }

  @override
  String get name => 'Hong Kong'; // Name of the country
}
