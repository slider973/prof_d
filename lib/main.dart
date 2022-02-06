import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/services/init_services/services_initializer.dart';
import 'core/utils/routes.dart';
import 'services/notification/notification.dart';
import 'services/user_prof_d/user_profd_bloc.dart';
import 'services/appointment_profd/appointment_bloc.dart' show AppointmentBloc;
import 'config/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme.dart';

Future<void> initServices() async {
  print('starting services ...');
  await Firebase.initializeApp();
  print('All services started...');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List results = await ServiceInitializer.instance.initializeSettings();
  runApp(ProviderScope(
    child: ProfBApp(
      locale: results[0],
    ),
  ));
}

class ProfBApp extends StatelessWidget {
  const ProfBApp({Key? key, required this.locale}) : super(key: key);
  final Locale locale;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation)  {
        return ScreenUtilInit(
          builder: () => AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              // For both Android + iOS
              statusBarColor: Colors.transparent,
              // For apps with a light background:
              // For Android (dark icons)
              statusBarIconBrightness: Brightness.dark,
              // For iOS (dark icons)
              statusBarBrightness: Brightness.light,
            ),
            child: GetMaterialApp(
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return widget!;
              },
              title: 'Prof D',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              initialRoute: RoutePaths.coreSplash,
              locale: locale,
              fallbackLocale: const Locale('fr'),
              onGenerateRoute: AppRouter.generateRoute,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('fr'),
                Locale('en'), // Spanish, no country code
              ],
            ),
          ),
        );
      }
    );
  }
}
