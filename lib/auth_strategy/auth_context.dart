import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStrategy {
  register(String email, String password) {}
  login(String email, String password) {}
}

class AuthContextStrategy {
  late AuthStrategy authStrategy;

  setAuthStrategy(AuthStrategy authStrategy) {
    this.authStrategy = authStrategy;
  }

  register(String email, String password) {
    authStrategy.register(email, password);
  }

  Future<User?> login(String email, String password) {
    return authStrategy.login(email, password);
  }
}
