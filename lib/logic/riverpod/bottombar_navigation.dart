import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final riverpodnavigator = ChangeNotifierProvider<NavigatorModel>((ref){
  return NavigatorModel(index: 0);
});

class NavigatorModel extends ChangeNotifier {
  int index;
  NavigatorModel({required this.index});

  void currentIndex(int newIndex){
    index = newIndex;
    notifyListeners();
  }
}