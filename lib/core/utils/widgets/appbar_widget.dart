import 'package:flutter/material.dart';
import 'package:space_x/localization/app_localization.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return AppBar(title: Text('AppBar Title ${localizations.home.title}'));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
