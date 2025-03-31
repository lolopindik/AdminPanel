import 'package:flutter/material.dart';

class AuthTextfield {
  Widget build(BuildContext context, String title) {
    return TextField(
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
