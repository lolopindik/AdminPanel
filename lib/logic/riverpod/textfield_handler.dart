import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textFieldControllerProvider = ChangeNotifierProvider.autoDispose.family<TextEditingController, String>(
  (ref, id) {
    final controller = TextEditingController();
    ref.onDispose(() => controller.dispose());
    return controller;
  },
);