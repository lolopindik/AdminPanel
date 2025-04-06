import 'package:admin_panel_study_hub/logic/riverpod/bottombar_navigation.dart';
import 'package:admin_panel_study_hub/presentation/screens/control_screen.dart';
import 'package:admin_panel_study_hub/presentation/screens/users_details_screen.dart';
import 'package:admin_panel_study_hub/presentation/screens/users_progress_screen.dart';
import 'package:admin_panel_study_hub/presentation/widgets/drawer_widget.dart';
import 'package:admin_panel_study_hub/presentation/widgets/main_bottombar.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: BottomBarWidget().build(context, ref),
      drawer: DrawerWidget().build(context, ref),
      body: IndexedStack(
        index: ref.watch(riverpodnavigator).index,
        children: [
          UsersProgressScreen(),
          ControlScreen(),
          UsersDetailsScreen(),
        ],
      )
    );
  }
}
