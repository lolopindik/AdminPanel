// ignore_for_file: unused_local_variable, use_build_context_synchronously, unrelated_type_equality_checks

import 'package:admin_panel_study_hub/data/firebase/user_data.dart';
import 'package:admin_panel_study_hub/logic/services/snackbars_services.dart';
import 'package:admin_panel_study_hub/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireabseServices {
  Future signIn(
    String emailAddress,
    String password,
    var routePage,
    BuildContext context,
  ) async {
    try {
      debugPrint('Attempting to sign in with email: $emailAddress');

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final userRole = await GetUserRole().userRole;
      debugPrint('User role: $userRole');

      if (userRole == "Admin") {
        debugPrint('Sign-in successful!');
        SnackbarsServices.showSuccessSnackbar(
          context,
          'Successfully signed in!',
        );
        context.router.replace(routePage);
      } else {
        debugPrint('Access only for admins');
        SnackbarsServices.showWarningSnackbar(context, 'Access denied!');
        context.router.replace(AccessDeniedRoute());
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');
      switch (e.code) {
        case 'user-not-found':
          SnackbarsServices.showErrorSnackbar(
            context,
            'No user found for that email.',
          );
          break;
        case 'wrong-password':
          SnackbarsServices.showErrorSnackbar(
            context,
            'Wrong password provided.',
          );
          break;
        default:
          SnackbarsServices.showErrorSnackbar(context, 'Error: ${e.message}');
      }
    }
  }

  Future signOut(BuildContext context, var routePage) async {
    try {
      await FirebaseAuth.instance.signOut();
      SnackbarsServices.showSuccessSnackbar(
        context,
        'Successfully signed out!',
      );

      if (context.mounted) {
        context.router.replace(routePage);
      } else {
        debugPrint('Widget is no longer mounted. Navigation skipped.');
      }
    } catch (e) {
      SnackbarsServices.showErrorSnackbar(context, 'Error during sign out: $e');
    }
  }
}
