import 'environement.dart';

const userCollection = 'users';
const childCollection = 'childs';
const appointmentCollection = 'appointments';

//sub collection
const eventsCollection = '$userCollection/:id/booked-events';

//pdf
final getBackendUrl = Environement.apiUrl;
