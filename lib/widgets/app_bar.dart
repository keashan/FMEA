import 'package:flutter/material.dart';

import '../screens/help_page.dart';
import '../screens/info_page.dart';
import '../screens/settings_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<IconButton> customAction;
  const AppBarWidget({
    Key? key,
    required this.title,
    required this.customAction,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    List<IconButton> actionList = [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
        icon: const Icon(Icons.settings),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HelpPage(),
            ),
          );
        },
        icon: const Icon(Icons.help),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InfoPage(),
            ),
          );
        },
        icon: const Icon(Icons.info),
      ),
    ];
    customAction.isNotEmpty ? actionList = customAction : null;
    return AppBar(
        title: Text(title),
        //centerTitle: true,
        //backgroundColor: Colors.amber,
        actions: actionList);
  }
}
