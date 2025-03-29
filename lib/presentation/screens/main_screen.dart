import 'package:admin_panel_study_hub/logic/riverpod/theme_switcher.dart';
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
      body: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('It is deploy dude', style: TextStyle(fontSize: 32)),
            ),
            ElevatedButton(
              onPressed: () => ref.read(themeProvider).toggleTheme(),
              child: Text('Push me'),
            ),
          ],
        ),
      ),
    );
  }
}
