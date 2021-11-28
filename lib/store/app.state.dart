import 'counter/counter.state.dart';

import './login/login.state.dart';

class AppState {
  final LoginState loginState;
  final CounterState counterState;

  AppState({required this.loginState, required this.counterState});

  factory AppState.initial() => AppState(
        loginState: LoginState.initial(),
        counterState: CounterState.initial(),
      );

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loginState == other.loginState;

  @override
  int get hashCode => super.hashCode ^ loginState.hashCode;

  @override
  String toString() {
    return "AppState {  loginState: $loginState }";
  }
}
