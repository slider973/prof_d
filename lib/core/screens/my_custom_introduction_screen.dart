import 'package:flutter/material.dart';

import '../../modules/home/screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../widgets/bottom_tab_bar.dart';

class MyCustomIntroductionScreen extends StatefulWidget {
  const MyCustomIntroductionScreen({Key? key}) : super(key: key);

  @override
  State<MyCustomIntroductionScreen> createState() =>
      _MyCustomIntroductionScreenState();
}

class _MyCustomIntroductionScreenState
    extends State<MyCustomIntroductionScreen> {
  final introKey = GlobalKey<_MyCustomIntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const BottomTabBarController()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/introduction_screen/$assetName',
        width: width);
  }

  Widget _buildLoginBackground([double width = 350]) {
    return Image.asset('assets/images/login/login_background.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );
    return Stack(children: [
      Container(
        color: Colors.white,
        width: double.infinity,
        child: _buildLoginBackground(),
      ),
      IntroductionScreen(
        key: introKey,
        showNextButton: false,
        globalBackgroundColor: Colors.transparent,
        globalFooter: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            child: const Text(
              "Passer l'introduction",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => _onIntroEnd(context),
          ),
        ),
        pages: [
          PageViewModel(
            title: "Création de profil",
            body:
            "Commencer par créer un profil afin de rajouter votre enfant et prendre des rendez-vous.",
            image: _buildImage('profile.jpg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Ajout d'un enfant",
            body:
            "Ajouter votre enfant à votre profil afin de lui pendre un rendez-vous.",
            image: _buildImage('4238140.jpg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Prise de rendez vous",
            body:
                "Choisissez un créneau pour votre enfant et sélectionner le dans la liste.",
            image: _buildImage('35232.jpg'),
            decoration: pageDecoration,
          ),

        ],
        onDone: () {
          // When done button is press
        },
        showBackButton: false,
        showSkipButton: true,
        skip: const Text("Passer à la fin"),
        done: const Text("Terminer", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    ]);
  }
}
