import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Text('It is deploy dude', style: TextStyle(fontSize: 32)),
        ),
      ),
    );
  }
}
