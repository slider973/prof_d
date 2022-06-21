part of 'user_profd_bloc.dart';

abstract class UserProfdEvent extends Equatable {
  const UserProfdEvent();
}

class CreateUserProfdEvent extends UserProfdEvent {
  final UserProfd user;
  const CreateUserProfdEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class SetUserProfdEvent extends UserProfdEvent {
  final UserProfd user;

  const SetUserProfdEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class UpdateUserProfdEvent extends UserProfdEvent {
  final UserProfd user;
  const UpdateUserProfdEvent(this.user);

  @override
  List<Object?> get props => [user];
}
