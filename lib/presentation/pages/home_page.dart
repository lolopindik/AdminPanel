import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage {
  Widget build(BuildContext context, WidgetRef ref){
    return Center(child: Text('Home page', style: TextStyle(fontSize: 32),),);
  }
}