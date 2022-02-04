part of 'appointment_bloc.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();
}

class SetAppointmentCreatedEvent extends AppointmentEvent {
  final Confirmed confirmed;

  const SetAppointmentCreatedEvent(this.confirmed);

  @override
  List<Object?> get props => [];
}
