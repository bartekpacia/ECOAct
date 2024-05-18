import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier({required FirebaseAuth auth}) : _auth = auth {
    _subscription = _auth.authStateChanges().listen((newUser) {
      notifyListeners();
    });
  }

  final FirebaseAuth _auth;
  StreamSubscription<void>? _subscription;

  User? get user => _auth.currentUser;

  /// Returns true if the sign up was successful, false otherwise.
  Future<bool> signUp({
    required String email,
    required String displayName,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _auth.currentUser!.updateDisplayName(displayName);
    } catch (err) {
      if (err is FirebaseAuthException) {
        return false;
      }

      rethrow;
    }

    return true;
  }

  /// Returns true if the sign in was successful, false otherwise.
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (err) {
      if (err is FirebaseAuthException) {
        return false;
      }

      rethrow;
    }

    return true;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
