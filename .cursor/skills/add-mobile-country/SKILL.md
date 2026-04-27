---
name: add-mobile-country
description: Adds a new mobile country implementation to this mobile_helper package with robust validation and test coverage. Use when the user asks to add a country, update dialing-code routing, implement country-specific number format logic, or create mobile country tests.
---

# Add Mobile Country

## Purpose

Add a new country to `mobile_helper` safely and completely:
- country implementation is correct
- country detection via `MobileValidator` remains correct
- formatting behavior is predictable
- tests cover positive and negative cases

## Project-Specific Rules

Follow these repository conventions exactly:

1. Country classes are `part of '../base_mobile_country.dart';`
2. New country files live in `lib/src/mobile_country/countries/`
3. `MobileCountry` registry is in `lib/src/mobile_country/base_mobile_country.dart`
4. Do not remove or reorder existing behavior unless requested
5. Keep fallback behavior (`OtherMobileCountry`) intact
6. Ensure country `code` is unique among non-empty codes
7. Ensure country `name` is unique

## Required Workflow

Copy this checklist and execute it in order:

```text
Add Mobile Country Progress
- [ ] 1) Inspect existing country patterns and tests
- [ ] 2) Create new country class file
- [ ] 3) Register new country in base_mobile_country.dart
- [ ] 4) Confirm flag asset exists and set flagAssetName
- [ ] 5) Add/extend tests for country logic
- [ ] 6) Add/extend MobileValidator coverage for detection/validation
- [ ] 7) Run targeted tests
- [ ] 8) Run full test suite if practical
- [ ] 9) Fix failures and re-run until green
```

## Implementation Steps

### 1) Create country class

Create `lib/src/mobile_country/countries/<country>_mobile_country.dart`:
- extend `MobileCountry`
- implement:
  - `name`
  - `code` (digits only, no `+`)
  - `checkFormat(String mobile)`
  - `formatMobile(String mobile)`
  - `flagAssetName`

Guidance:
- Use strict, explicit regex for `checkFormat`
- Accept only intended number formats (avoid permissive matching)
- Normalize input in `formatMobile` using digit cleanup (`replaceAll(RegExp(r'\D'), '')`) when needed
- Return stable output format for valid numbers
- For invalid inputs, keep behavior explicit and predictable (typically return cleaned/original string based on existing country style)

### 2) Register the country

Update `lib/src/mobile_country/base_mobile_country.dart`:
- add `part 'countries/<country>_mobile_country.dart';`
- add `<Country>MobileCountry()` into `_mobileCountries`

Keep all existing countries and fallback country present.

### 3) Flag asset mapping

Set `flagAssetName` to an existing file in `assets/flags/`.

If missing:
- add the flag file to `assets/flags/`
- keep lowercase file naming consistent with existing assets

### 4) Country tests

Create `test/<country>_mobile_country_test.dart` with:
- `code` expectation
- `name` expectation
- `checkFormat` valid cases
- `checkFormat` invalid cases
- `formatMobile` cases:
  - valid local input
  - valid country-code input
  - invalid input handling
  - non-digit cleanup behavior

Prefer multiple realistic examples, not only one happy path.

### 5) Validator tests

Update `test/mobile_validator_test.dart` (or add equivalent coverage):
- ensure `MobileValidator.getCountryFromMobile` returns the new country for prefix-matching input
- ensure no regression for existing countries and fallback
- ensure `MobileValidator.isValid` behavior is correct for at least one valid and one invalid number for the new country

## Robustness Checks (Mandatory)

Before finishing, verify:

- Prefix routing is unambiguous:
  - if codes share prefixes, longer code must still resolve correctly
- No duplicate country code among non-empty codes
- No duplicate country name
- `checkFormat` and `formatMobile` do not contradict each other on valid inputs
- `formatMobile` handles symbols/spaces safely
- tests include edge lengths (too short/too long)

## Commands

Run these commands after edits:

```bash
flutter test test/<country>_mobile_country_test.dart
flutter test test/mobile_validator_test.dart
flutter test
```

If full suite is expensive, run targeted tests first and report what was run.

## Completion Criteria

Task is complete only when:
- implementation compiles
- new + affected tests pass
- validator routing remains correct
- no duplicate names/codes introduced
- user receives a concise change summary and test results
