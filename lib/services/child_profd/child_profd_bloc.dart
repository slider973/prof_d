import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prof_d/models/user_child_prod.dart';
import 'package:prof_d/repositories/child_repository.dart';

part 'child_profd_event.dart';
part 'child_profd_state.dart';

class ChildProfdBloc extends Bloc<ChildProfdEvent, ChildProfdState> {
  ChildProfdBloc() : super(ChildProfdInitial()) {
    on<SetChildProfdEvent>((event, emit) {
      ChildRepository.addChildToUserDoc(event.child);
      emit(SetChildProfdState(event.child));
    });

    on<UpdateChildProfdEvent>((event, emit) {
      ChildRepository.updateChildToUserDoc(event.idChild, event.child);
      emit(SetChildProfdState(event.child));
    });
  }
}
