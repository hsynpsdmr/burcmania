import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringExtension on String {
  String get locale => this.tr();
  String get localeUpper => this.tr().toUpperCase();
  String get localeLower => this.tr().toLowerCase();
  String? get isValidEmail => contains(RegExp(ApplicationConstants.emailRegex)) ? null : 'Email does not valid';

  bool get isValidEmails => RegExp(ApplicationConstants.emailRegex).hasMatch(this);
}

extension ImagePathExtansion on String {
  String get toSVG => "assets/svg/$this.svg";
}
