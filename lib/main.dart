import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'config/environement.dart';
import 'core/services/init_services/services_initializer.dart';
import 'core/utils/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import 'theme/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environement.fileName);
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Europe/Paris'));
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
    return OrientationBuilder(builder: (context, orientation) {
      return ScreenUtilInit(
        builder: (context, widget) => AnnotatedRegion<SystemUiOverlayStyle>(
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
              ScreenUtil.init(context);
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
              SfGlobalLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('fr'),
              Locale('en'), // English, no country code
            ],
          ),
        ),
      );
    });
  }
}
