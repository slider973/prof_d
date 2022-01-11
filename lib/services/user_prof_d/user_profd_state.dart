part of 'user_profd_bloc.dart';

abstract class UserProfdState extends Equatable {
  const UserProfdState();
}

class UserProfdInitial extends UserProfdState {
  @override
  List<Object> get props => [];

}

class UpdateUserProfdState extends UserProfdState {
  final UserProfd user;
  const UpdateUserProfdState(this.user);

  @override
  List<Object?> get props => [user];
}

