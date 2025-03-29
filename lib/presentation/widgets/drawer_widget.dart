import 'package:admin_panel_study_hub/logic/riverpod/theme_switcher.dart';
import 'package:admin_panel_study_hub/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class DrawerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider);
    final isDarkMode = themeNotifier.themeData == darkMode;

    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        (!isDarkMode) ? 'Light theme' : 'Dark theme',
                        style: TextStyle(fontSize: 20),
                      ),
                      Gap(10),
                      (!isDarkMode) ?  Icon(Icons.sunny) : Icon(Icons.dark_mode),
                    ],
                  ),
                  Gap(20),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) => ref.read(themeProvider).toggleTheme(),
                  ),
                ],
              ),
            ),
            Text('Version: Alpha'),
          ],
        ),
      ),
    );
  }
}