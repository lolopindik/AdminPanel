import 'package:admin_panel_study_hub/logic/riverpod/textfield_handler.dart';
import 'package:admin_panel_study_hub/logic/services/fireabse_services.dart';
import 'package:admin_panel_study_hub/presentation/routes/router.gr.dart';
import 'package:admin_panel_study_hub/presentation/widgets/auth_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AuthPage {
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerEmail = ref.watch(textFieldControllerProvider('authEmail'));
    final controllerPassword = ref.watch(
      textFieldControllerProvider('authPassword'),
    );
    final bool isValid = EmailValidator.validate(controllerEmail.text);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: Colors.transparent,
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 40,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Gap(MediaQuery.of(context).size.height * 0.2),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 800,
                        minHeight: 300,
                        maxWidth: 400,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Authorization',
                              style: TextStyle(fontSize: 32, color: Colors.white),
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 600,
                              minHeight: 250,
                              maxWidth: 400,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).secondaryHeaderColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.height * 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                children: [
                                  AuthTextfield().build(
                                    context,
                                    'Email',
                                    ref,
                                    'authEmail',
                                    false,
                                  ),
                                  Gap(
                                    MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  AuthTextfield().build(
                                    context,
                                    'Password',
                                    ref,
                                    'authPassword',
                                    true,
                                  ),
                                  Gap(
                                    MediaQuery.of(context).size.height * 0.03,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      debugPrint('Email: $controllerEmail');
                                      debugPrint(
                                        'Password: $controllerPassword',
                                      );
                                      debugPrint('Email validation: $isValid');
                                      FirebaseServices().signIn(
                                        controllerEmail.text.trim(),
                                        controllerPassword.text.trim(),
                                        MainRoute(),
                                        context,
                                        ref
                                      );
                                    },
                                    child: Text('Continue'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(MediaQuery.of(context).size.height * 0.2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
