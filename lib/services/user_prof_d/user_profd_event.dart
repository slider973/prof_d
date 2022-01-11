part of 'user_profd_bloc.dart';

abstract class UserProfdEvent extends Equatable {
  const UserProfdEvent();
}


class UpdateUserProfdEvent extends UserProfdEvent {
  final UserProfd user;
  const UpdateUserProfdEvent(this.user);

  @override
  List<Object?> get props => [user];
}

