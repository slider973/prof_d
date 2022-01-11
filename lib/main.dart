import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'config/routes.dart';
import 'widgets/bottom_tab_bar.dart';
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
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeProfD1,
          initialRoute: '/',
          routes: routes,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('fr'),
            Locale('en'),// Spanish, no country code
          ],
        );
      },
    );
  }
}
