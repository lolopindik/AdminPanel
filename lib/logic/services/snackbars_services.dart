import 'package:flutter/material.dart';

class SnackbarsServices {
  static void showSnackbar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
  }) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: backgroundColor ?? Colors.blueGrey,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    } else {
      debugPrint('Widget is no longer mounted. Snackbar skipped.');
    }
  }

  static void showSuccessSnackbar(BuildContext context, String message) {
    showSnackbar(context, message, backgroundColor: Colors.green);
  }

  static void showErrorSnackbar(BuildContext context, String errorMessage) {
    showSnackbar(context, errorMessage, backgroundColor: Colors.red);
  }

  static void showWarningSnackbar(BuildContext context, String message) {
    showSnackbar(context, message, backgroundColor: Colors.amber);
  }
}
