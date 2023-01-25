import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fmea/models/fmea_model.dart';
import 'package:fmea/widgets/date_input_row.dart';
import 'package:fmea/widgets/text_input_row.dart';

import '../widgets/app_bar.dart';

class AddEditDataPage extends StatefulWidget {
  late bool isEdit;
  final String itemKey;
  final FMEAData item;

  AddEditDataPage({
    Key? key,
    this.isEdit = false,
    this.itemKey = "",
    required this.item,
  }) : super(key: key);

  @override
  State<AddEditDataPage> createState() => _AddEditDataPageState();
}

class _AddEditDataPageState extends State<AddEditDataPage> {
  TextEditingController section = TextEditingController();
  TextEditingController machine = TextEditingController();
  TextEditingController problemOccured = TextEditingController();
  TextEditingController problem = TextEditingController();
  TextEditingController frequency = TextEditingController();
  TextEditingController severity = TextEditingController();
  TextEditingController detectability = TextEditingController();
  TextEditingController fs = TextEditingController();
  TextEditingController rpn = TextEditingController();
  TextEditingController rootCause = TextEditingController();
  TextEditingController correctiveAction = TextEditingController();
  TextEditingController preventiveAction = TextEditingController();
  TextEditingController dueDate = TextEditingController();
  TextEditingController responsible = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController remarks = TextEditingController();

  @override
  void dispose() {
    section.dispose();
    machine.dispose();
    problemOccured.dispose();
    problem.dispose();
    frequency.dispose();
    severity.dispose();
    detectability.dispose();
    fs.dispose();
    rpn.dispose();
    rootCause.dispose();
    correctiveAction.dispose();
    preventiveAction.dispose();
    dueDate.dispose();
    status.dispose();
    remarks.dispose();
    super.dispose();
  }

  void asignData() {
    section.text = widget.item.section.toString();
    machine.text = widget.item.machine.toString();
    problemOccured.text = widget.item.problemOccured.toString();
    problem.text = widget.item.problem.toString();
    frequency.text = widget.item.frequency.toString();
    severity.text = widget.item.severity.toString();
    detectability.text = widget.item.detectability.toString();
    fs.text = widget.item.fs.toString();
    rpn.text = widget.item.rpn.toString();
    rootCause.text = widget.item.rootCause.toString();
    correctiveAction.text = widget.item.correctiveAction.toString();
    preventiveAction.text = widget.item.preventiveAction.toString();
    dueDate.text = widget.item.dueDate.toString();
    responsible.text = widget.item.responsible.toString();
    status.text = widget.item.status.toString();
    remarks.text = widget.item.remarks.toString();
  }

  calc() {
    int f;
    int s;
    int d;
    if (frequency.text.isNotEmpty) {
      f = int.parse(frequency.text);
    } else {
      f = 0;
    }
    if (severity.text.isNotEmpty) {
      s = int.parse(severity.text);
    } else {
      s = 0;
    }
    if (detectability.text.isNotEmpty) {
      d = int.parse(detectability.text);
    } else {
      d = 0;
    }

    fs.text = (f * s).toString();
    rpn.text = (f * s * d).toString();
  }

  savedata() async {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref();
    widget.item.section = section.text;
    widget.item.machine = machine.text;
    widget.item.problemOccured = problemOccured.text;
    widget.item.problem = problem.text;
    widget.item.frequency = frequency.text;
    widget.item.severity = severity.text;
    widget.item.detectability = detectability.text;
    widget.item.fs = fs.text;
    widget.item.rpn = rpn.text;
    widget.item.rootCause = rootCause.text;
    widget.item.correctiveAction = correctiveAction.text;
    widget.item.preventiveAction = preventiveAction.text;
    widget.item.dueDate = dueDate.text;
    widget.item.responsible = responsible.text;
    widget.item.status = status.text;
    widget.item.remarks = remarks.text;
    Map<String, dynamic> data = {
      "section": section.text,
      "machine": machine.text,
      "problemoccurred": problemOccured.text,
      "problem": problem.text,
      "frequency": frequency.text,
      "severity": severity.text,
      "detectability": detectability.text,
      "fs": fs.text,
      "rpn": rpn.text,
      "rootcause": rootCause.text,
      "correctiveaction": correctiveAction.text,
      "preventiveaction": preventiveAction.text,
      "duedate": dueDate.text,
      "responsible": responsible.text,
      "status": status.text,
      "remarks": remarks.text,
    };
    if (widget.isEdit) {
      dbRef.child("FMEA").child("KTKTools").child(widget.itemKey).update(data);
    } else {
      dbRef.child("FMEA").child("KTKTools").push().set(data);
    }
  }

  clear() {
    widget.isEdit = false;
    section.clear();
    machine.clear();
    problemOccured.clear();
    problem.clear();
    frequency.clear();
    severity.clear();
    detectability.clear();
    fs.clear();
    rpn.clear();
    rootCause.clear();
    correctiveAction.clear();
    preventiveAction.clear();
    dueDate.clear();
    responsible.clear();
    status.clear();
    remarks.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEdit) {
      asignData();
    }
    return Scaffold(
      //backgroundColor: Colors.lime,
      appBar: AppBarWidget(
        title: "FMEA Tool",
        customAction: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              clear();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              width: double.infinity,
              child: Column(
                children: [
                  TextInputRowWidget(
                    lbl: "Section",
                    hint: "type here",
                    lines: 1,
                    keytype: TextInputType.text,
                    controller: section,
                  ),
                  TextInputRowWidget(
                    lbl: "Machine",
                    hint: "type here",
                    lines: 1,
                    keytype: TextInputType.text,
                    controller: machine,
                  ),
                  DateInputRowWidget(
                    lbl: "Problem Occurred",
                    hint: "tap to select",
                    lines: 1,
                    keytype: TextInputType.number,
                    dateController: problemOccured,
                  ),
                  TextInputRowWidget(
                    lbl: "Problem",
                    hint: "type here",
                    lines: 3,
                    keytype: TextInputType.text,
                    controller: problem,
                  ),
                  TextInputRowWidget(
                    lbl: "Frequency",
                    hint: "1-10",
                    lines: 1,
                    keytype: TextInputType.number,
                    controller: frequency,
                    onchanged: calc,
                  ),
                  TextInputRowWidget(
                    lbl: "Severity",
                    hint: "1-10",
                    lines: 1,
                    keytype: TextInputType.number,
                    controller: severity,
                    onchanged: calc,
                  ),
                  TextInputRowWidget(
                    lbl: "Detectability",
                    hint: "1-10",
                    lines: 1,
                    keytype: TextInputType.number,
                    controller: detectability,
                    onchanged: calc,
                  ),
                  TextInputRowWidget(
                    lbl: "F*S",
                    hint: "",
                    lines: 1,
                    keytype: TextInputType.number,
                    controller: fs,
                  ),
                  TextInputRowWidget(
                    lbl: "RpN",
                    hint: "",
                    lines: 1,
                    keytype: TextInputType.number,
                    controller: rpn,
                  ),
                  TextInputRowWidget(
                      lbl: "Root Cause",
                      hint: "type here",
                      lines: 3,
                      keytype: TextInputType.text,
                      controller: rootCause),
                  TextInputRowWidget(
                      lbl: "Corrective Action",
                      hint: "type here",
                      lines: 3,
                      keytype: TextInputType.text,
                      controller: correctiveAction),
                  TextInputRowWidget(
                      lbl: "Preventive Action",
                      hint: "type here",
                      lines: 3,
                      keytype: TextInputType.text,
                      controller: preventiveAction),
                  DateInputRowWidget(
                      lbl: "Due Date",
                      hint: "tap to select",
                      lines: 1,
                      keytype: TextInputType.number,
                      dateController: dueDate),
                  TextInputRowWidget(
                      lbl: "Responsible",
                      hint: "type here",
                      lines: 1,
                      keytype: TextInputType.text,
                      controller: responsible),
                  TextInputRowWidget(
                      lbl: "Status",
                      hint: "type here",
                      lines: 1,
                      keytype: TextInputType.text,
                      controller: status),
                  TextInputRowWidget(
                      lbl: "Remarks",
                      hint: "type here",
                      lines: 3,
                      keytype: TextInputType.text,
                      controller: remarks)
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await savedata().then(
              (value) => widget.isEdit ? Navigator.pop(context) : clear());
          //FocusScope.of(context).unfocus();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
