import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fmea/models/fmea_model.dart';
import 'package:fmea/widgets/button_row.dart';
import 'package:fmea/widgets/date_input_row.dart';
import 'package:fmea/widgets/text_input_row.dart';

import '../widgets/app_bar.dart';

class AddEditDataPage extends StatefulWidget {
  late  bool isEdit;
  final String itemKey;
  final Map items;

  AddEditDataPage({Key? key, this.isEdit=false, this.itemKey="",  required this.items }) : super(key: key);

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

  FMEAData item = FMEAData();


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

  void asignData(){
    section.text = widget.items["section"].toString();
    machine.text = widget.items["machine"].toString();
    problemOccured.text = widget.items["problemOccurred"].toString();
    problem.text = widget.items["problem"].toString();
    frequency.text = widget.items["frequency"].toString();
    severity.text = widget.items["severity"].toString();
    detectability.text = widget.items["detectability"].toString();
    fs.text = widget.items["fs"].toString();
    rpn.text = widget.items["rpn"].toString();
    rootCause.text = widget.items["rootCause"].toString();
    correctiveAction.text = widget.items["correctiveAction"].toString();
    preventiveAction.text = widget.items["preventiveAction"].toString();
    dueDate.text = widget.items["dueDate"].toString();
    responsible.text = widget.items["responsible"].toString();
    status.text = widget.items["status"].toString();
    remarks.text = widget.items["remarks"].toString();
  }

  calc() {
    int f;
    int s;
    int d;
    if (frequency.text.isNotEmpty){
      f = int.parse(frequency.text);
    }else{
      f=0;
    }
    if (severity.text.isNotEmpty){
      s = int.parse(severity.text);
    }else{
      s=0;
    }
    if (detectability.text.isNotEmpty){
      d = int.parse(detectability.text);
    }else{
      d=0;
    }

    fs.text = (f * s).toString();
    rpn.text = (f * s * d).toString();
  }

  savedata() async {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref();
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
    if (widget.isEdit){
      dbRef.child("FMEA").child("KTKTools").child(widget.itemKey).update(data);
    }else {
      dbRef.child("FMEA").child("KTKTools").push().set(data).then((value)  =>
          clear());
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
    if (widget.isEdit){
      asignData();
    }
    return Scaffold(
      //backgroundColor: Colors.lime,
      appBar: AppBarWidget(
        title: "FMEA Tool",
        customAction: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed:() {
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
                  TextInputRowWidget(lbl:"Section", hint: "type here", lines: 1, keytype: TextInputType.text, controller: section,),
                  TextInputRowWidget(lbl:"Machine", hint: "type here", lines: 1, keytype: TextInputType.text, controller: machine,),
                  DateInputRowWidget(lbl:"Problem Occurred", hint: "tap to select", lines: 1, keytype: TextInputType.number, dateController: problemOccured,),
                  TextInputRowWidget(lbl:"Problem", hint: "type here", lines: 3, keytype: TextInputType.text, controller: problem,),
                  TextInputRowWidget(lbl:"Frequency", hint: "1-10", lines: 1, keytype: TextInputType.number, controller: frequency, onchanged: calc,),
                  TextInputRowWidget(lbl:"Severity", hint: "1-10", lines: 1, keytype: TextInputType.number, controller: severity, onchanged: calc,),
                  TextInputRowWidget(lbl:"Detectability", hint: "1-10", lines: 1, keytype: TextInputType.number, controller: detectability, onchanged: calc,),
                  TextInputRowWidget(lbl:"F*S", hint: "", lines: 1, keytype: TextInputType.number, controller: fs,),
                  TextInputRowWidget(lbl:"RpN", hint: "", lines: 1, keytype: TextInputType.number, controller: rpn,),
                  TextInputRowWidget(lbl:"Root Cause", hint: "type here", lines: 3, keytype: TextInputType.text, controller: rootCause),
                  TextInputRowWidget(lbl:"Corrective Action", hint: "type here", lines: 3, keytype: TextInputType.text, controller: correctiveAction),
                  TextInputRowWidget(lbl:"Preventive Action", hint: "type here", lines: 3, keytype: TextInputType.text, controller: preventiveAction),
                  DateInputRowWidget(lbl:"Due Date", hint: "tap to select", lines: 1, keytype: TextInputType.number, dateController: dueDate),
                  TextInputRowWidget(lbl:"Responsible", hint: "type here", lines: 1, keytype: TextInputType.text, controller: responsible),
                  TextInputRowWidget(lbl:"Status", hint: "type here", lines: 1, keytype: TextInputType.text, controller: status),
                  TextInputRowWidget(lbl: "Remarks", hint: "type here", lines: 3, keytype: TextInputType.text, controller: remarks)
                ],
              )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         await savedata().then((value) => Navigator.pop(context));
         //FocusScope.of(context).unfocus();

        },
        child: const Icon(Icons.save),
      ),
    );
  }
}


