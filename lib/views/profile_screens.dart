import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import '../container/handle_child_profile.dart';
import '../screens/auth/login_page_new.dart';
import '../theme/app_theme.dart';

class ProfDProfileScreen extends StatefulWidget {
  const ProfDProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfDProfileScreenState createState() => _ProfDProfileScreenState();
}

class _ProfDProfileScreenState extends State<ProfDProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleRow({String? title, IconData? icon, void Function()? cb}) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 15.0),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: FxContainer(
                paddingAll: 8,
                borderRadiusAll: 4,
                color: theme.colorScheme.onBackground.withAlpha(20),
                child: Icon(
                  icon,
                  color: customTheme.profDPrimary,
                  size: 20,
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: theme.colorScheme.onBackground.withAlpha(160),
              ),
              title: FxText.b3(
                title!,
              ),
              onTap: cb,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List buildRowList = [
      _buildSingleRow(title: 'Paramètres du profil', icon: FeatherIcons.user),
      _buildSingleRow(title: 'Mot de passe', icon: FeatherIcons.lock),
      _buildSingleRow(
          title: 'Les enfants',
          icon: FeatherIcons.users,
          cb: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HandleChildProfile()));
          }),
      _buildSingleRow(
          title: 'Se déconnecter',
          icon: FeatherIcons.logOut,
          cb: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false);
          }),
    ];
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          FxSpacing.height(54),
          const Center(
            child: FxContainer(
              paddingAll: 0,
              borderRadiusAll: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/images/profile/avatar_4.jpg'),
                ),
              ),
            ),
          ),
          FxSpacing.height(24),
          FxText.t1(
            'Jonathan lemaine',
            textAlign: TextAlign.center,
            fontWeight: 600,
            letterSpacing: 0.8,
          ),
          FxSpacing.height(4),
          FxSpacing.height(24),
          FxText.b3(
            'General',
            color: theme.colorScheme.onBackground,
            xMuted: true,
          ),
          ListView.builder(
            itemCount: buildRowList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Divider(),
                  FxSpacing.height(8),
                  buildRowList[index]
                ],
              );
            },
          )
        ],
      )),
    );
  }
}
