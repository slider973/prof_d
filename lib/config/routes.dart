import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth/auth_bloc.dart';

import '../screens/home_page.dart';
import '../widgets/splash_screen.dart';

final routes = {
  '/': (context) => MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
        create: (context) => AuthBloc()),
  ], child: const SplashScreen()),
};
