import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/user_repository.dart';
import '../../models/user.dart';

part 'user_profd_event.dart';

part 'user_profd_state.dart';

class UserProfdBloc extends Bloc<UserProfdEvent, UserProfdState> {
  UserProfdBloc() : super(UserProfdInitial()) {
    on<UpdateUserProfdEvent>((event, emit) {
      UserRepository.addUserDoc(event.user);
      emit(UpdateUserProfdState(event.user));
    });
    on<SetUserProfdEvent>((event, emit) {
      emit(GetProfdState(event.user));
    });
  }
}
