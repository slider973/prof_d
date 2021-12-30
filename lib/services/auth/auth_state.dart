part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class RegisterState extends AuthState {
  final UserCredential userCredential;
  const RegisterState(this.userCredential);
}
