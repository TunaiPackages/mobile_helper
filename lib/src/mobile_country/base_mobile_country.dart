import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'countries/brunei_mobile_country.dart';
part 'countries/indonesia_mobile_country.dart';
part 'countries/malaysia_mobile_country.dart';
part 'countries/singapore_mobile_country.dart';
part 'countries/philippines_mobile_country.dart';
part 'countries/hong_kong_mobile_country.dart';
part 'countries/india_mobile_country.dart';
part 'countries/sri_lanka_mobile_country.dart';
part 'countries/thailand_mobile_country.dart';
part 'countries/china_mobile_country.dart';
part 'countries/england_mobile_country.dart';
part 'countries/taiwan_mobile_country.dart';
part 'countries/other_mobile_country.dart';

sealed class MobileCountry extends Equatable {
  /// Display name used for UI/logging (for example: `Malaysia`, `Hong Kong`).
  String get name;

  /// Country dialing prefix used by `MobileValidator` for country detection.
  ///
  /// Keep this as digits only (for example: `60`, `852`).
  /// Return an empty string only for the fallback country (`Other`).
  String get code;

  /// Returns `true` when [mobile] matches this country's expected number format.
  ///
  /// Used by `MobileValidator.isValid` after country detection.
  bool checkFormat(String mobile);

  /// Returns a user-friendly representation of [mobile] for this country.
  ///
  /// Implementations may normalize separators/spacing while preserving intent.
  String formatMobile(String mobile);

  /// Asset file name under `assets/flags` (for example: `my.png`).
  String get flagAssetName;

  Widget buildFlag({double size = 24}) => Image.asset(
        'assets/flags/$flagAssetName',
        package: 'mobile_helper',
        width: size,
        height: size,
      );

  @override
  List<Object> get props => [name, code];
}

final Set<MobileCountry> _mobileCountries = {
  MalaysiaMobileCountry(),
  SingaporeMobileCountry(),
  BruneiMobileCountry(),
  IndonesiaMobileCountry(),
  PhilippinesMobileCountry(),
  HongKongMobileCountry(),
  IndiaMobileCountry(),
  SriLankaMobileCountry(),
  ThailandMobileCountry(),
  ChinaMobileCountry(),
  EnglandMobileCountry(),
  TaiwanMobileCountry(),
  OtherMobileCountry(),
};

Set<MobileCountry> getMobileCountries() => _mobileCountries;
