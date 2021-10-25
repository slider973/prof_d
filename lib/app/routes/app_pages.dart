import '../modules/book_appointement/bindings/book_appointment_binding.dart';
import '../modules/book_appointement/views/book_appointement_view.dart';

import '../modules/clinic/bindings/clinic_bindings.dart';
import '../modules/clinic/views/clinic_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/checkout/views/confirmation_view.dart';
import '../modules/paramedic/views/emergency_view2.dart';
import '../modules/doctor/bindings/doctor_bindings.dart';
import '../modules/doctor/views/doctor_view.dart';
import '../modules/book_doctor/bindings/book_doctor_binding.dart';
import '../modules/book_doctor/views/book_doctor_view.dart';
import '../modules/alarm/bindings/alarms_binding.dart';
import '../modules/alarm/views/adding_alarm_view.dart';
import '../modules/help_privacy/bindings/help_privacy_binding.dart';
import '../modules/help_privacy/views/help_view.dart';
import '../modules/help_privacy/views/privacy_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/language_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/settings/views/theme_mode_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/messages/views/chats_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/account/views/account_view.dart';
import '../modules/speciality/bindings/specialities_binding.dart';
import '../modules/speciality/views/specialities_view.dart';
import '../modules/paramedic/bindings/paramedic_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/tabs/bindings/tabs_bindings.dart';
import '../modules/tabs/views/tabs_view.dart';
import '../modules/auth/views/forgot_password_view.dart';
import '../modules/auth/views/phone_verification_view.dart';
import '../modules/auth/views/profile_filling_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/on_boarding/views/on_boarding_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/on_boarding/bindings/on_boarding_binding.dart';
import 'package:get/get.dart' show GetPage, Transition;
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(name: Routes.ROOT, page: () => OnBoardingView(),binding: OnBoardingBinding()),
    GetPage(name: Routes.LOGIN, page: () => LoginView(),binding: AuthBinding()),
    GetPage(name: Routes.REGISTER, page: () => RegisterView(),binding: AuthBinding()),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordView(),binding: AuthBinding()),
    GetPage(name: Routes.PHONE_VERIFICATION, page: () => PhoneVerificationView(),binding: AuthBinding()),
    GetPage(name: Routes.PROFILE_FILLING, page: () => ProfileFillingView(),binding: AuthBinding()),
    GetPage(name: Routes.TABS, page: () => TabsView(),binding: TabsBinding()),
    GetPage(name: Routes.SEARCH, page: () => SearchView(),binding: TabsBinding()),
    GetPage(name: Routes.EMERGENCY, page: () => Emergency2View(),binding: ParamedicBinding(),transition: Transition.downToUp),
    GetPage(name: Routes.SPECIALITIES, page: () => SpecialitiesView(),binding: SpecialitiesBinding()),
    GetPage(name: Routes.PROFILE, page: () => AccountView(),binding: ProfileBinding()),
    GetPage(name: Routes.NOTIFICATIONS, page: () => NotificationsView(),binding: NotificationsBinding()),
    GetPage(name: Routes.CHAT, page: () => ChatsView()),
    GetPage(name: Routes.SETTINGS, page: () => SettingsView(), binding: SettingsBinding()),
    GetPage(name: Routes.SETTINGS_THEME_MODE, page: () => ThemeModeView(), binding: SettingsBinding()),
    GetPage(name: Routes.SETTINGS_LANGUAGE, page: () => LanguageView(), binding: SettingsBinding()),
    GetPage(name: Routes.PRIVACY, page: () => PrivacyView(), binding: HelpPrivacyBinding()),
    GetPage(name: Routes.HELP, page: () => HelpView(), binding: HelpPrivacyBinding()),
    GetPage(name: Routes.ALARM, page: () => AddAlarmView(), binding: AlarmsBinding()),
    GetPage(name: Routes.CLINIC, page: () => ClinicView(), binding: ClinicBinding(),transition: Transition.downToUp),
    GetPage(name: Routes.DOCTOR, page: () => DoctorView(), binding: DoctorBinding(),transition: Transition.downToUp),
    GetPage(name: Routes.BOOK_APPOINTMENT, page: () => BookingAppointmentView(), binding: BookingAppointmentBinding(),transition: Transition.downToUp),
    GetPage(name: Routes.BOOK_DOCTOR, page: () => BookingView(), binding: BookDoctorBinding()),
    GetPage(name: Routes.CHECKOUT, page: () => CheckoutView(), binding: CheckoutBinding()),
    GetPage(name: Routes.CONFIRMATION, page: () => ConfirmationView(), binding: CheckoutBinding()),
  ];
}
