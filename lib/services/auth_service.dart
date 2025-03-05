import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends ChangeNotifier {
  // أضف ChangeNotifier هنا
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // تسجيل الدخول
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners(); // إعلام المستمعين بتغيير الحالة
      return result.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  // إنشاء حساب
  Future<User?> register(
      String email, String password, String username, String role) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(result.user?.uid).set({
        'username': username,
        'email': email,
        'role': role,
        'cvUrl': null,
      });

      notifyListeners(); // إعلام المستمعين بتغيير الحالة
      return result.user;
    } catch (e) {
      print("Error registering: $e");
      return null;
    }
  }

  // تسجيل الخروج
  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners(); // إعلام المستمعين بتغيير الحالة
  }

  // الحصول على المستخدم الحالي
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // التحقق من أن username فريد
  Future<bool> isUsernameUnique(String username) async {
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    return snapshot.docs.isEmpty;
  }
}
