import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import '../../widgets/bottom_tab_bar.dart';
import '../../services/auth/auth_bloc.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
  'test@test.com': 'test',
};

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => const Duration(milliseconds: 2250);
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> _authUser(LoginData data) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: data.name, password: data.password);
      if (userCredential != null) {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return 'error';
    }
  }

  Future<String?>? _signUser(SignupData data) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: data.name!, password: data.password!);

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return 'Error when to try to connect';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<String?> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        print(!users.containsKey(name));
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<AuthBloc>(create: (context) => AuthBloc())],
        child: Center(
          child: FlutterLogin(
            title: null,
            logo: 'assets/image/logo.jpg',
            onLogin: _authUser,
            onSignup: _signUser,
            onSubmitAnimationCompleted: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const BottomTabBarController(),
              ));
            },
            onRecoverPassword: _recoverPassword,
            messages: LoginMessages(
                userHint: 'Nom d\'utilisateur',
                passwordHint: 'Mot de passe',
                confirmPasswordHint: 'Confirmation de mot de passe',
                loginButton: 'Se connecter',
                signupButton:'S\'inscrire',
                forgotPasswordButton:'Mot de passe oublié',
                recoverPasswordButton:'Retrouver le mot de passe',
                goBackButton: 'Retour'
            )
    ),
        ));
  }
}
