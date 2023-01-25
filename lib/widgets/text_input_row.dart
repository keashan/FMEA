import 'package:flutter/material.dart';

class TextInputRowWidget extends StatelessWidget {
  final String lbl;
  final String hint;
  final int lines;
  final TextInputType keytype;
  final TextEditingController controller;
  final Function? onchanged;
  const TextInputRowWidget({
    Key? key,
    required this.lbl,
    required this.hint,
    required this.lines,
    required this.keytype,
    required this.controller,
    this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: ((50 * lines)).toDouble(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              lbl,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: keytype,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: hint,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              ),
              maxLines: lines,
              controller: controller,
              enabled: hint.isEmpty ? false : true,
              onChanged: (value) {
                if (onchanged != null) {
                  onchanged!();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
