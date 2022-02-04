import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'services/notification/notification.dart';
import 'services/user_prof_d/user_profd_bloc.dart';
import 'services/appointment_profd/appointment_bloc.dart' show AppointmentBloc;
import 'config/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme/app_theme.dart';

Future<void> initServices() async {
  print('starting services ...');
  await Firebase.initializeApp();
  print('All services started...');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const ProfBApp());
}

class ProfBApp extends StatelessWidget {
  const ProfBApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
            providers: [
              BlocProvider<AppointmentBloc>(
                  create: (context) => AppointmentBloc()),
              BlocProvider<UserProfdBloc>(
                  create: (context) => UserProfdBloc())
            ],
            child: MaterialApp(
              title: 'Prof D',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              initialRoute: '/',
              routes: routes,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('fr'),
                Locale('en'), // Spanish, no country code
              ],
            ));
      },
    );
  }
}
