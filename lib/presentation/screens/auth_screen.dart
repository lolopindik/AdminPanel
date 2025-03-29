import 'package:admin_panel_study_hub/presentation/pages/auth_page.dart';
import 'package:admin_panel_study_hub/presentation/widgets/auth_appbar.dart';
import 'package:admin_panel_study_hub/presentation/widgets/drawer_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AuthAppbar().build(context, ref),
      drawer: DrawerWidget().build(context, ref),
      body: AuthPage().build(context, ref),
    );
  }
}
