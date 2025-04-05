import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class AccessDeniedPage {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Gap(MediaQuery.of(context).size.height * 0.2),
          Image.asset(
            'lib/logic/assets/Images/eye.gif',
            width: 200,
            height: 200,
          ),
          Text('Access only for admins', style: TextStyle(fontSize: 32)),
        ],
      ),
    );
  }
}
