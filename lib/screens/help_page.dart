import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: "Help",
        customAction: [],
      ),
      body: Center(
        child: Text('Help'),
      ),
    );
  }
}
