// ignore_for_file: unused_local_variable, avoid_print, use_build_context_synchronously

import 'package:admin_panel_study_hub/logic/services/snackbars_services.dart';
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
      print(
        'Attempting to sign in with email: $emailAddress and password: $password',
      );

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      print('Sign-in successful!');
      SnackbarsServices.showSuccessSnackbar(context, 'Successfully signed in!');

      if (context.mounted) {
        context.router.replace(routePage);
      } else {
        print('Widget is no longer mounted. Navigation skipped.');
      }
    } on FirebaseAuthException catch (e) {
      print(
        'FirebaseAuthException caught: code = ${e.code}, message = ${e.message}',
      );
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
            'Wrong password provided for that user.',
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
        print('Widget is no longer mounted. Navigation skipped.');
      }
    } catch (e) {
      SnackbarsServices.showErrorSnackbar(context, 'Error during sign out: $e');
    }
  }
}
