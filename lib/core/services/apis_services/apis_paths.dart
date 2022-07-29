class ApisPaths {
  ///Google Map
  static String googleMapAutoCompletePath() =>
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  static String googleMapPlaceDetailsPath() =>
      'https://maps.googleapis.com/maps/api/place/details/json';
  static String googleMapDirectionsPath() =>
      'https://maps.googleapis.com/maps/api/directions/json';

  ///CONNECTION
  static String signInWithEmailAndPasswordPath() => '/auth/login';

  static String signUpWithEmailAndPasswordPath() => '/auth/register';
  static String mePatch() => '/auth/me';

  //PROFILE
  static String updateUserProfilePath() => '/settings/profile';
}
