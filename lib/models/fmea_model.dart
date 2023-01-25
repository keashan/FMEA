class FMEA {
  String? key;
  FMEAData? fmeaData;

  FMEA({
    this.key,
    this.fmeaData,
  });
}

class FMEAData {
  String? section;
  String? machine;
  String? problemOccured;
  String? problem;
  String? frequency;
  String? severity;
  String? detectability;
  String? fs;
  String? rpn;
  String? rootCause;
  String? correctiveAction;
  String? preventiveAction;
  String? dueDate;
  String? responsible;
  String? status;
  String? remarks;

  FMEAData({
    this.section,
    this.machine,
    this.problemOccured,
    this.problem,
    this.frequency,
    this.severity,
    this.detectability,
    this.fs,
    this.rpn,
    this.rootCause,
    this.correctiveAction,
    this.preventiveAction,
    this.dueDate,
    this.responsible,
    this.status,
    this.remarks,
  });

  FMEAData.fromJson(Map<dynamic, dynamic> json) {
    section = json['section'];
    machine = json['machine'];
    problemOccured = json['problemoccurred'];
    problem = json['problem'];
    frequency = json['frequency'];
    severity = json['severity'];
    detectability = json['detectability'];
    fs = json['fs'];
    rpn = json['rpn'];
    rootCause = json['rootcause'];
    correctiveAction = json['correctiveaction'];
    preventiveAction = json['preventiveaction'];
    dueDate = json['duedate'];
    responsible = json['responsible'];
    status = json['status'];
    remarks = json['remarks'];
  }
}
