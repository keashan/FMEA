

import 'package:flutter/material.dart';

class ButtonRow extends StatefulWidget {
  final String lbl;
  final Function? onpressed;
  const ButtonRow({Key? key, required this.lbl, this.onpressed}) : super(key: key);

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: ((50 * lines)).toDouble(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                if (widget.onpressed != null) {
                  widget.onpressed!();
                }
              },
              label: Text(widget.lbl),
              icon: const Icon(Icons.save),
            ),
          ),
        ],
      ),
    );
  }
}
