import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutx/flutx.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
import '../../../services/notification/notification.dart';
import '../../../widgets/handle_update_profil.dart';
import '../../../screens/auth/login_page_new.dart';
import '../../../theme/app_theme.dart';
import 'child_screen/child_list_screen.dart';

class AccountScreen extends ConsumerWidget {
  AccountScreen({Key? key}) : super(key: key);

  late ThemeData theme = AppTheme.theme;
  late CustomTheme customTheme = AppTheme.customTheme;

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
  Widget build(BuildContext context, ref) {
    final _userModel =
        ref.watch(mainCoreViewModelProvider.notifier).getCurrentUser();
    final List buildRowList = [
      // _buildSingleRow(
      //   title: 'Paramètres du profil',
      //   icon: FeatherIcons.user,
      //   cb: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => HandleUpdateProfile()),
      //     );
      //   },
      // ),
      // _buildSingleRow(
      //     title: 'Mot de passe',
      //     icon: FeatherIcons.lock,
      //     cb: () {
      //       PushNotificationService.showNotification(
      //           title: 'Mot de passe',
      //           body: 'erlkgnbherznboerbhoeiroibth',
      //           payload: 'sarah.abs');
      //     }),
      _buildSingleRow(
          title: 'Les enfants',
          icon: FeatherIcons.users,
          cb: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChildListScreen(),
              ),
            );
          }),
    //   _buildSingleRow(
    //       title: 'Se déconnecter',
    //       icon: FeatherIcons.logOut,
    //       cb: () async {
    // /*        await FirebaseAuth.instance.signOut();
    //         Navigator.pushAndRemoveUntil(
    //             context,
    //             MaterialPageRoute(builder: (context) => const LoginScreen()),
    //             (route) => false);*/
    //       }),
    ];

    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            FxSpacing.height(60),
            FxText.t1(
              "${_userModel?.lastname!} ${_userModel?.firstname!}",
              textAlign: TextAlign.center,
              fontWeight: 600,
              letterSpacing: 0.8,
            ),
            FxSpacing.height(4),
            FxSpacing.height(60),
            ListView.builder(
              itemCount: buildRowList.length,
              physics: NeverScrollableScrollPhysics(),
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
        ),
      )),
    );
  }
}
