import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: "About Us", customAction: [],),
      body: Center(
        child: Text('About Us'),
      ),
    );
  }
}
