import 'package:admin_panel_study_hub/presentation/pages/users_details_page.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UsersDetailsScreen extends ConsumerWidget {
  const UsersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: UsersDetailsPage().build(context, ref),
    );
  }
}