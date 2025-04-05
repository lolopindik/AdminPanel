import 'package:admin_panel_study_hub/logic/services/fireabse_services.dart';
import 'package:admin_panel_study_hub/presentation/pages/access_denied_page.dart';
import 'package:admin_panel_study_hub/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AccessDeniedScreen extends ConsumerWidget {
  const AccessDeniedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => FirebaseServices().signOut(context, AuthRoute(), ref),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: AccessDeniedPage().build(context),
    );
  }
}
