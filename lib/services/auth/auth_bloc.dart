import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../auth_strategy/firebase_strategy.dart';
import '../../auth_strategy/auth_context.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) {
      final authContext = AuthContextStrategy();
      authContext.setAuthStrategy(FirebaseAuthStrategy());
      final userInput = authContext.register(event.email, event.password);
      if (userInput is UserCredential) {
        emit(RegisterState(userInput));
      }
    });

    on<LoginEvent>((event, emit) async {
      final authContext = AuthContextStrategy();
      authContext.setAuthStrategy(FirebaseAuthStrategy());
      final userInput = await authContext.login(event.email, event.password);
      if (userInput is User) {
        emit(LoginState(userInput));
      }
    });
  }
}
