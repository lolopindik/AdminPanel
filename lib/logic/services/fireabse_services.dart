// ignore_for_file: unused_local_variable, use_build_context_synchronously, unrelated_type_equality_checks

import 'package:admin_panel_study_hub/data/firebase/user_data.dart';
import 'package:admin_panel_study_hub/logic/riverpod/auth_status.dart';
import 'package:admin_panel_study_hub/logic/services/snackbars_services.dart';
import 'package:admin_panel_study_hub/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseServices {
  Future<void> signIn(
    String emailAddress,
    String password,
    PageRouteInfo routePage,
    BuildContext context,
    WidgetRef ref,
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
        ref.read(authStatusProvider.notifier).setAuthStatus(role: userRole);
        debugPrint('Sign-in successful!');
        SnackbarsServices.showSuccessSnackbar(
          context,
          'Successfully signed in!',
        );
        context.router.replacePath('/main');
      } else {
        SnackbarsServices.showWarningSnackbar(context, 'Access denied!');
        context.router.replace(const AccessDeniedRoute());
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
    } catch (e) {
      debugPrint('Unexpected error: $e');
      SnackbarsServices.showErrorSnackbar(
        context,
        'An unexpected error occurred: $e',
      );
    }
  }

  Future<void> signOut(
    BuildContext context,
    PageRouteInfo routePage,
    WidgetRef ref,
  ) async {
    try {
      await FirebaseAuth.instance.signOut();
      ref.read(authStatusProvider.notifier).clearAuthStatus();

      if (!context.mounted) return;

      SnackbarsServices.showSuccessSnackbar(
        context,
        'Successfully signed out!',
      );
      context.router.replacePath('/auth');
    } catch (e) {
      if (!context.mounted) return;

      SnackbarsServices.showErrorSnackbar(context, 'Error during sign out: $e');
    }
  }
}
