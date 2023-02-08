import 'package:flutter/material.dart';

class DropDownRowWidget extends StatefulWidget {
  final String lbl;
  String status;
  final Function? onchanged;
  DropDownRowWidget({
    Key? key,
    required this.lbl,
    this.onchanged,
    this.status = "Open",
  }) : super(key: key);

  @override
  State<DropDownRowWidget> createState() => _DropDownRowWidgetState();
}

class _DropDownRowWidgetState extends State<DropDownRowWidget> {
  List<String> statusList = ["Open", "Closed"];
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: ((50 * lines)).toDouble(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.lbl,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              ),
              value: widget.status,
              items: statusList
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: (item) => widget.onchanged!(widget.status = item!),
            ),
          ),
        ],
      ),
    );
  }
}
