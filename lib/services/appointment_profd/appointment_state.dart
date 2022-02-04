part of 'appointment_bloc.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState();
}

class AppointmentInitial extends AppointmentState {
  @override
  List<Object> get props => [];
}


class AppointmentCreated extends AppointmentState {
  final Appointments appointments;

  const AppointmentCreated(this.appointments);

  @override
  List<Object> get props => [];
}