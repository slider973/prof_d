part of 'child_profd_bloc.dart';

abstract class ChildProfdState extends Equatable {
  const ChildProfdState();
}

class ChildProfdInitial extends ChildProfdState {
  @override
  List<Object> get props => [];
}

class SetChildProfdState extends ChildProfdState {
  final UserChildProfd child;
  const SetChildProfdState(this.child);

  @override
  List<Object?> get props => [child];
}

