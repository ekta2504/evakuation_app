import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/app_constant.dart';
import '../utils/constants/color_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/src/widgets/toast_message.dart';

extension StringExtension on String {
  String getInitials() => isNotEmpty
      ? trim().split(' ').map((e) => e[0]).take(2).join().toUpperCase()
      : '';

  Color hexToColor() =>
      isEmpty ? secondaryColor : Color(int.parse(replaceAll('#', "0xff")));

  bool _emailValidation(String value) {
    return RegExp(validEmailRegex).hasMatch(value);
  }

  // Check Email Validation
  String? isValidEmail(BuildContext context) {
    if (trim().isEmpty) {
      showToast(AppLocalizations.of(context)?.msgEmailEmpty ?? '');
      return "";
      // AppLocalizations.of(context)?.msgEmailEmpty ?? '';
    } else if (!_emailValidation(trim())) {
      showToast(AppLocalizations.of(context)?.msgEmailInvalid ?? '');
      return ""; //AppLocalizations.of(context)?.msgEmailInvalid ?? '';
    } else {
      return null;
    }
  }

  // Empty Field Validation
  String? isFieldEmpty(String message) {
    if (trim().isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  bool _passwordValidation(String value) {
    return RegExp(validPasswordRegex).hasMatch(value);
  }

  // Check Password Validation
  String? isValidPassword(BuildContext context) {
    if (trim().isEmpty) {
      showToast(AppLocalizations.of(context)?.msgPasswordEmpty ?? '');
      return ""; // AppLocalizations.of(context)?.msgPasswordEmpty ?? '';
    } else if (!_passwordValidation(trim())) {
      showToast(AppLocalizations.of(context)?.msgPasswordError ?? '');
      return ""; // AppLocalizations.of(context)?.msgPasswordError ?? '';
    } else {
      return null;
    }
  }

  // Check Valid Confirm Password
  String? isValidConfirmPassword(String newPassword, BuildContext context) {
    if (newPassword.trim() != trim()) {
      return AppLocalizations.of(context)?.msgPasswordNotMatch ?? '';
    } else {
      return null;
    }
  }
}

extension ColorExtension on Color {
  String colorToHex() => "#${value.toRadixString(16).substring(2)}";
}
