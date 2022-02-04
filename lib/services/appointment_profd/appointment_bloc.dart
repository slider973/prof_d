import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prof_d/models/confirmed.dart';
import '../../repositories/appointment_repository.dart';
import '../../models/appointments.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc() : super(AppointmentInitial()) {
    on<AppointmentEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SetAppointmentCreatedEvent>((event, emit) async {
      print(event.confirmed.startDate);
     await AppointmentRepository().createAppointment(event.confirmed);
    });


  }
}
