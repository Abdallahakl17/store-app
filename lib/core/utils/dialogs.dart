import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/core/extensions/context_navigation.dart';
import 'package:store_app/l10n/app_localizations.dart';

class DialogUtils {
  /// Show SnackBar
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    final colors = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? colors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Show Loading Dialog
  static void showLoading(
    BuildContext context, {
    bool dismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) {
        return PopScope(
          canPop: dismissible,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            content: const SizedBox(
              height: 60,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Safely hide dialog 
  static void hideDialog(BuildContext context) {
    context.maybePop();
  }

  /// Show Toast Message
  static void showToastMessage({
    required String message,
    required Color bgColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 14.sp,
    );
  }

  /// Show Logout Confirmation Dialog and return true if user confirms logout, otherwise false
  static Future<bool> showLogoutDialog(
    BuildContext context, {
    String? title,
    String? desc,
  }) async {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final tr = AppLocalizations.of(context);

    if (tr == null) return false;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            icon: Icon(
              Icons.warning_amber_rounded,
              color: colors.error,
              size: 48.w,
            ),
            title: Text(
              title ?? tr.logout,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge,
            ),
            content: Text(
              desc ?? tr.confirmLogoutDesc,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium,
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              TextButton(
                onPressed: () => context.pop(false),
                child: Text(
                  tr.cancel,
                  style: textTheme.titleMedium,
                ),
              ),
              TextButton(
                onPressed: () => context.pop(true),
                child: Text(
                  tr.ok,
                  style: textTheme.titleMedium?.copyWith(
                    color: colors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    return result ?? false;
  }
}