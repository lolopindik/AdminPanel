import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class Userdata {
  Future<String?> get userId async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        debugPrint('Current user: ${user.uid}');
        return user.uid;
      } else {
        debugPrint('No user signed in');
      }
    } catch (e) {
      debugPrint('User error: $e');
    }
    return null;
  }
}

class GetUserRole extends Userdata {
  Future<String> get userRole async {
    String? uid = await userId;
    if (uid != null) {
      DatabaseReference roleRef = FirebaseDatabase.instance.ref(
        'UserDetails/$uid/role',
      );
      try {
        DatabaseEvent event = await roleRef.once();
        DataSnapshot snapshot = event.snapshot;
        if (snapshot.exists) {
          String? role = snapshot.value.toString();
          debugPrint('User role: $role');
          return role;
        } else {
          debugPrint('No role found for user.');
        }
      } catch (e) {
        debugPrint('Error fetching user role: $e');
      }
    } else {
      debugPrint("User ID is null. Cannot get user role.");
    }
    return 'no role';
  }
}