import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
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

  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        FxContainer(
          paddingAll: 8,
          borderRadiusAll: 4,
          color: theme.colorScheme.onBackground.withAlpha(20),
          child: Icon(
            icon,
            color: customTheme.medicarePrimary,
            size: 20,
          ),
        ),
        FxSpacing.width(16),
        Expanded(
          child: FxText.b3(
            title!,
          ),
        ),
        FxSpacing.width(16),
        Icon(
          Icons.keyboard_arrow_right,
          color: theme.colorScheme.onBackground.withAlpha(160),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.fromLTRB(24, 52, 24, 24),
        children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxContainer.rounded(
                color: customTheme.medicarePrimary,
                height: 6,
                width: 6,
                child: Container(),
              ),
              FxSpacing.width(6),
              FxText.b3(
                'Premium (9 days)',
                color: customTheme.medicarePrimary,
                muted: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          FxSpacing.height(24),
          FxText.b3(
            'General',
            color: theme.colorScheme.onBackground,
            xMuted: true,
          ),
          FxSpacing.height(24),
           const Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Paramètres du profil', icon: FeatherIcons.user),
          FxSpacing.height(8),
          const Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Mot de passe', icon: FeatherIcons.lock),
          FxSpacing.height(8),
          const Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Se déconnecter', icon: FeatherIcons.logOut),
        ],
      ),
    );
  }
}
