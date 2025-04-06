import 'package:admin_panel_study_hub/presentation/pages/users_progress_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UsersProgressScreen extends StatelessWidget {
  const UsersProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UsersProgressPage().build(context),
    );
  }
}