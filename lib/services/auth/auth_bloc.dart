

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth_strategy/auth_context.dart';
import '../../auth_strategy/firebase_strategy.dart';

part 'auth_state.dart';
part 'auth_event.dart';

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
