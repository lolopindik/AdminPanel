import 'package:admin_panel_study_hub/logic/riverpod/bottombar_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: ref.watch(riverpodnavigator).index,
      onTap: (index) {
        ref.read(riverpodnavigator).currentIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart,),
          label: 'Progress',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_tree,),
          label: 'Сontrol',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Users list',
        ),
      ],
    );
  }
}