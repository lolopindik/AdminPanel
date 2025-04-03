import 'package:admin_panel_study_hub/logic/services/fireabse_services.dart';
import 'package:admin_panel_study_hub/presentation/pages/access_denied_page.dart';
import 'package:admin_panel_study_hub/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AccessDeniedScreen extends StatelessWidget {
  const AccessDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => FireabseServices().signOut(context, AuthRoute()),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: AccessDeniedPage().build(context),
    );
  }
}
