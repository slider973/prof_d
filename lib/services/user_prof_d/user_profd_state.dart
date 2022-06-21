part of 'user_profd_bloc.dart';

abstract class UserProfdState extends Equatable {
  const UserProfdState();
}

class UserProfdInitial extends UserProfdState {
  @override
  List<Object> get props => [];
}

class CreateUserProfdState extends UserProfdState {
  final UserProfd user;
  const CreateUserProfdState(this.user);

  @override
  List<Object?> get props => [user];
}

class GetProfdState extends UserProfdState {
  final UserProfd user;
  const GetProfdState(this.user);

  @override
  List<Object?> get props => [user];
}
