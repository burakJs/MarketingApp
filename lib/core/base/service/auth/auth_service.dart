import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  AuthService();

  User? get currentUser;
  Future<String?> register(String email, String password);
  Future<String?> login(String email, String password);
  Future<String?> resetPassword(String email);
  Future<void> logOut();
}
