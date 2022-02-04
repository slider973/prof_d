import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/confirmed.dart';
import '../config/config_route_collection.dart';
import '../models/appointments.dart';

class AppointmentRepository {
  Future<void> createAppointment(Confirmed confirmed) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;


      final List<Confirmed> confirmedList = [];
      confirmedList.add(confirmed);

      final newAppointment = Appointments.fromJson({
        'confirmed': confirmedList,
      });



      if (currentUser != null) {
        CollectionReference appointment = FirebaseFirestore.instance
            .collection(userCollection)
            .doc(currentUser.uid)
            .collection(appointmentCollection);

        await appointment.add(newAppointment.toJson());
        print('appointment created');
        return;
      }
    } catch (e) {
      print(e);
    }
  }
}
