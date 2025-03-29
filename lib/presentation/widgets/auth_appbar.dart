import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthAppbar {
  PreferredSizeWidget? build(BuildContext context, WidgetRef ref){
    return
    AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: Builder(
        builder: (BuildContext innerContext) {
          return IconButton(
            onPressed: () {
              Scaffold.of(innerContext).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        },
      ),
    );
  }
}