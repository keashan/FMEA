import 'package:flutter/material.dart';
import 'package:fmea/colors.dart';
import 'package:fmea/models/fmea_model.dart';
import 'package:fmea/screens/add_edit_data.dart';
import 'package:fmea/widgets/app_bar.dart';
import 'package:fmea/widgets/detail_page_row.dart';

class DetailPage extends StatelessWidget {
  final FMEAData item;
  final String itemKey;
  final int index;
  const DetailPage({Key? key, required this.item, required this.itemKey, required this.index}) : super(key: key);

  createMap() {
    Map<String, dynamic> map = {
      'section': item.section,
      'machine': item.machine,
      'problemOccurred': item.problemOccured,
      'problem': item.problem,
      'frequency': item.frequency,
      'severity': item.severity,
      'detectability': item.detectability,
      'fs': item.fs,
      'rpn': item.rpn,
      'rootCause': item.rootCause,
      'correctiveAction': item.correctiveAction,
      'preventiveAction': item.preventiveAction,
      'dueDate': item.dueDate,
      'responsible': item.responsible,
      'status': item.status,
      'remarks': item.remarks,
    };
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Detail Page',
        customAction: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditDataPage(
                    isEdit: true,
                    itemKey: itemKey,
                    items: createMap(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child:
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: itemColor(index),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailRow(lbl: 'Section: ${item.section}'),
                  DetailRow(lbl: 'Machine: ${item.machine}'),
                  DetailRow(lbl: 'Problem Occurred: ${item.problemOccured}'),
                  DetailRow(lbl: 'Problem: ${item.problem}'),
                  DetailRow(lbl: 'Frequency: ${item.frequency}'),
                  DetailRow(lbl: 'Severity: ${item.severity}'),
                  DetailRow(lbl: 'Detectability: ${item.detectability}'),
                  DetailRow(lbl: 'RPN: ${item.rpn}'),
                  DetailRow(lbl: 'Root Cause: ${item.rootCause}'),
                  DetailRow(lbl: 'Corrective Action: ${item.correctiveAction}'),
                  DetailRow(lbl: 'Preventive Action: ${item.preventiveAction}'),
                  DetailRow(lbl: 'Responsible: ${item.responsible}'),
                  DetailRow(lbl: 'Due Date: ${item.dueDate}'),
                  DetailRow(lbl: 'Status: ${item.status}'),
                  DetailRow(lbl: 'Remarks: ${item.remarks}'),],
              ),
            ),
        ),
      ),
    );
  }
}
