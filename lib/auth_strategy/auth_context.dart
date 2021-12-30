abstract class AuthStrategy {
  register(String email, String password) {}
}

class AuthContextStrategy {
  late AuthStrategy authStrategy;

  setAuthStrategy(AuthStrategy authStrategy) {
    this.authStrategy = authStrategy;
  }

  register(String email, String password) {
    authStrategy.register(email, password);
  }
}
