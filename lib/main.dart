import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sizer/sizer.dart';
import 'screens/auth/register_page.dart';
import 'store/counter/counter.state.dart';
import 'store/login/login.state.dart';
import 'store/app.state.dart';
import 'package:redux/redux.dart';

import 'store/app.reducer.dart';
import 'theme/app_theme.dart';

void initServices() async {
  print('starting services ...');
  await Firebase.initializeApp();
  print('All services started...');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(
      loginState: LoginState(false, ''),
      counterState: CounterState(0),
    ),
  );

  initServices();

  runApp(ProfBApp(store: store));
}

class ProfBApp extends StatelessWidget {
  final Store<AppState> store;
  const ProfBApp({Key? key, required this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: Sizer(
          builder:  (context, orientation, deviceType) {
           return  MaterialApp(
             title: 'Flutter Demo',
             debugShowCheckedModeBanner: false,
             theme: AppTheme.themeProfD1,
             home: const RegisterPage(),
           );
          },
        ));
  }
}
