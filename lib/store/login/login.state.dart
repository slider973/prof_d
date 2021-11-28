class LoginState {
  final bool loading;
  final String error;

  LoginState(this.loading, this.error);

  factory LoginState.initial() => LoginState(false, '');

  LoginState copyWith({required bool loading, required String error}) =>
      LoginState(loading, error);

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          error == other.error;

  @override
  int get hashCode =>
      super.hashCode ^ runtimeType.hashCode ^ loading.hashCode ^ error.hashCode;

  @override
  String toString() => "LoginState { loading: $loading,  error: $error}";
}
