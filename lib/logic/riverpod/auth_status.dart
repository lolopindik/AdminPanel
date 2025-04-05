import 'package:admin_panel_study_hub/data/firebase/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

final authStatusProvider = ChangeNotifierProvider<AuthStatusNotifier>(
  (ref) => AuthStatusNotifier(),
);

class AuthStatusNotifier extends ChangeNotifier {
  late Box _box;
  bool _isAuth = false;
  String? _role;

  bool get isAuth => _isAuth;
  String? get role => _role;

  AuthStatusNotifier() {
    _init();
  }

  Future<void> _init() async {
    _box = Hive.box('AuthStatus');
    _isAuth = _box.get('isLoggined', defaultValue: false);
    _role = _box.get('userRole');

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _isAuth = true;
      try {
        final userRole = await GetUserRole().userRole;
        _role = userRole;
        _box.put('userRole', _role);
        _box.put('isLoggined', true);
        debugPrint('Initialized with Firebase role: $_role');
      } catch (e) {
        debugPrint('Error fetching role from Firebase: $e');
        _isAuth = false;
        _role = null;
        _box.put('isLoggined', false);
        _box.put('userRole', null);
      }
    } else {
      _isAuth = false;
      _role = null;
      _box.put('isLoggined', false);
      _box.put('userRole', null);
    }

    debugPrint('HiveBox(AuthStatus): isLoggined: $_isAuth && userRole: $_role');
    notifyListeners();
  }

  void setAuthStatus({String? role}) {
    final user = FirebaseAuth.instance.currentUser;
    _isAuth = user != null;
    _role = role ?? _role;
    _box.put('isLoggined', _isAuth);
    _box.put('userRole', _role);
    notifyListeners();
  }

  void clearAuthStatus() {
    _isAuth = false;
    _role = null;
    _box.put('isLoggined', false);
    _box.put('userRole', null);
    notifyListeners();
  }
}