import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputRowWidget extends StatefulWidget {
  final String lbl;
  final String hint;
  final int lines;
  final TextInputType keytype;
  final TextEditingController dateController;
  const DateInputRowWidget({
    Key? key, required this.lbl, required this.hint, required this.lines, required this.keytype, required this.dateController,
  }) : super(key: key);

  @override
  State<DateInputRowWidget> createState() => _DateInputRowWidgetState();
}

class _DateInputRowWidgetState extends State<DateInputRowWidget> {
  pickdate() async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2100)) as DateTime;
    if (pickedDate != null){
      String formattedDate = DateFormat("yyyy-MM-dd").format(pickedDate);
      setState(() {
        widget.dateController.text =formattedDate;
        FocusScope.of(context).unfocus();
      });
    }
    else{
      print("Date is not selected");
    }
  }

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
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: widget.hint,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              ),
              keyboardType: widget.keytype,
              maxLines: widget.lines,
              controller: widget.dateController,
              readOnly: true,
              onTap: () {
                pickdate();
              },
            ),
          ),
        ],
      ),
    );
  }
}