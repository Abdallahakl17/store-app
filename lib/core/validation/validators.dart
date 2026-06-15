import 'package:flutter/material.dart';
import 'package:store_app/l10n/app_localizations.dart';
 
class Validators {
  Validators._();

  static final RegExp emailRegex = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );

  static final RegExp phoneRegex = RegExp(
    r'^01[0125]\d{8}$',
  );

  static String? validateName(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return l10n.nameRequired;
    }

    if (trimmedValue.length < 2) {
      return l10n.nameTooShort;
    }

    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return l10n.enterYourEmail;
    }

    if (!emailRegex.hasMatch(trimmedValue)) {
      return l10n.invalidEmail;
    }

    return null;
  }

  static String? validateTitle(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return l10n.titleRequired;
    }

    if (trimmedValue.length < 3) {
      return l10n.titleTooShort;
    }

    return null;
  }

  static String? validateDescription(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return l10n.descriptionRequired;
    }

    if (trimmedValue.length < 10) {
      return l10n.descriptionTooShort;
    }

    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return l10n.enterYourPassword;
    }

    if (trimmedValue.length < 6) {
      return l10n.passwordTooShort;
    }

    return null;
  }

  static String? validatePhone(BuildContext context, String? value) {
    final l10n = AppLocalizations.of(context)!;
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return l10n.phoneRequired;
    }

    if (!phoneRegex.hasMatch(trimmedValue)) {
      return l10n.invalidPhone;
    }

    return null;
  }
}