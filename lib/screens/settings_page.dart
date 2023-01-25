import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: "Settings",
        customAction: [],
      ),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
