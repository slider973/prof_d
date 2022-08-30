import '../core/services/init_services/configuration_service.dart';

const userCollection = 'users';
const childCollection = 'childs';
const appointmentCollection = 'appointments';

//sub collection
const eventsCollection = '$userCollection/:id/booked-events';

//pdf
const getBackendUrl = 'https://api.sylvie-profd.com';