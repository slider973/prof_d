part of 'child_profd_bloc.dart';

abstract class ChildProfdEvent extends Equatable {
  const ChildProfdEvent();
}

class SetChildProfdEvent extends ChildProfdEvent {
  final UserChildProfd child;
  const SetChildProfdEvent(this.child);

  @override
  List<Object?> get props => [child];
}

class UpdateChildProfdEvent extends ChildProfdEvent {
  final UserChildProfd child;
  final String idChild;
  const UpdateChildProfdEvent(this.idChild, this.child);

  @override
  List<Object?> get props => [child];
}
