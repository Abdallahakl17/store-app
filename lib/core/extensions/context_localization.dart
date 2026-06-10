import 'package:flutter/widgets.dart';
import 'package:store_app/l10n/app_localizations.dart';

extension LocalizationExt on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}