import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import '../../../services/notification/notification.dart';
import '../../../widgets/handle_update_profil.dart';
import '../../../widgets/image_profile_widget.dart';
import '../../../container/handle_child_profile.dart';
import '../../../screens/auth/login_page_new.dart';
import '../../../theme/app_theme.dart';

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

  @override
  void dispose() {
    super.dispose();
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
      _buildSingleRow(
        title: 'Paramètres du profil',
        icon: FeatherIcons.user,
        cb: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HandleUpdateProfile()),
          ).then((value) => setState(() {}));
        },
      ),
      _buildSingleRow(
          title: 'Mot de passe',
          icon: FeatherIcons.lock,
          cb: () {
            PushNotificationService.showNotification(
                title: 'Mot de passe',
                body: 'erlkgnbherznboerbhoeiroibth',
                payload: 'sarah.abs');
          }),
      _buildSingleRow(
          title: 'Les enfants',
          icon: FeatherIcons.users,
          cb: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HandleChildProfile(),
              ),
            );
          }),
      _buildSingleRow(
          title: 'Se déconnecter',
          icon: FeatherIcons.logOut,
          cb: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
          }),
    ];
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          final document = snapshot.data!.docs.firstWhere((document) =>
              document.id == FirebaseAuth.instance.currentUser!.uid);
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          return Scaffold(
            body: SingleChildScrollView(
                child: Column(
              children: [
                FxSpacing.height(54),
                Center(
                  child: ImageProfileWidget(userPhotoUrl: data['image']),
                ),
                FxSpacing.height(24),
                FxText.t1(
                  '${data['firstname']} ${data['lastname']}',
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
        });
  }
}
