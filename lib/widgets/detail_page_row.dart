import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final String lbl;
  const DetailRow({Key? key, required this.lbl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
        child: Text(lbl, style: const TextStyle(color: Colors.black, fontSize: 24),));
  }
}
