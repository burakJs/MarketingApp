import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketing_app/core/base/service/auth/auth_service.dart';

class AuthManager extends AuthService {
  @override
  User? get currentUser => auth.currentUser;

  @override
  Future<String?> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  Future<String?> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  Future<String?> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  @override
  Future<void> logOut() {
    return auth.signOut();
  }
}
