import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AuthPage {
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      //todo clear textfield controller
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Gap(MediaQuery.of(context).size.height * 0.2),
            Center(
              child: Container(
                color: Theme.of(context).secondaryHeaderColor,
                height: 200,
                width: 350,
                child: TextField(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
