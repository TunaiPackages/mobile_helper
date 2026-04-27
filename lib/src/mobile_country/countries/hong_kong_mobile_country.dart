part of '../base_mobile_country.dart';

class HongKongMobileCountry extends MobileCountry {
  @override
  bool checkFormat(String mobile) {
    // Hong Kong mobile numbers typically start with the country code 852 and are followed by 8 digits that start with 5, 6, or 9
    final RegExp hkMobilePattern = RegExp(r'^852[569]\d{7}$');
    return hkMobilePattern.hasMatch(mobile);
  }

  @override
  String get code => '852'; // Hong Kong country code

  @override
  String formatMobile(String mobile) {
    // Format the mobile number to include the country code
    // For example, '85291234567' becomes '852 9123 4567' (ignore leading 852).
    if (checkFormat(mobile)) {
      // `checkFormat` expects the number to include the `852` country code.
      // For formatting we want to group only the local 8 digits (4 + 4),
      // so we strip the leading country code first.
      final localMobile = mobile.substring(code.length); // remove leading '852'
      return '$code ${localMobile.substring(0, 4)} ${localMobile.substring(4)}';
    } else {
      return mobile;
    }
  }

  @override
  String get name => 'Hong Kong'; // Name of the country

  @override
  String get flagAssetName => 'hk.png';
}
