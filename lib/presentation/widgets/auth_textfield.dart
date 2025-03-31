import 'package:admin_panel_study_hub/logic/riverpod/textfield_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthTextfield {
  Widget build(BuildContext context, String title, WidgetRef ref, String fieldId) {
    
    final controller = ref.watch(textFieldControllerProvider(fieldId));

    return TextField(
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: '$title:',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
