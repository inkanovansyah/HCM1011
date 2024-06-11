import 'dart:convert';

class ModelGoalSetting {
  int? status;
  dynamic error;
  String? messages;
  List<Datum>? data;

  ModelGoalSetting({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  ModelGoalSetting copyWith({
    int? status,
    dynamic error,
    String? messages,
    List<Datum>? data,
  }) =>
      ModelGoalSetting(
        status: status ?? this.status,
        error: error ?? this.error,
        messages: messages ?? this.messages,
        data: data ?? this.data,
      );

  factory ModelGoalSetting.fromRawJson(String str) =>
      ModelGoalSetting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelGoalSetting.fromJson(Map<String, dynamic> json) =>
      ModelGoalSetting(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? employeeId;
  String? sectionId;
  String? questionValue;
  String? weightage;
  dynamic selfValueWeek;
  String? selfValue;
  String? level1Value;
  String? level2Value;
  String? totalValue;
  String? goalSelfSubmit;
  DateTime? goalSelfSubmitDate;
  String? goalApprovalSubmit;
  DateTime? goalApprovalSubmitDate;
  String? isDelete;
  String? selfSubmit;
  String? isApproval1;
  String? isApproval2;
  String? status;
  String? statusEntry;

  Datum({
    this.id,
    this.employeeId,
    this.sectionId,
    this.questionValue,
    this.weightage,
    this.selfValueWeek,
    this.selfValue,
    this.level1Value,
    this.level2Value,
    this.totalValue,
    this.goalSelfSubmit,
    this.goalSelfSubmitDate,
    this.goalApprovalSubmit,
    this.goalApprovalSubmitDate,
    this.isDelete,
    this.selfSubmit,
    this.isApproval1,
    this.isApproval2,
    this.status,
    this.statusEntry,
  });

  Datum copyWith({
    String? id,
    String? employeeId,
    String? sectionId,
    String? questionValue,
    String? weightage,
    dynamic selfValueWeek,
    String? selfValue,
    String? level1Value,
    String? level2Value,
    String? totalValue,
    String? goalSelfSubmit,
    DateTime? goalSelfSubmitDate,
    String? goalApprovalSubmit,
    DateTime? goalApprovalSubmitDate,
    String? isDelete,
    String? selfSubmit,
    String? isApproval1,
    String? isApproval2,
    String? status,
    String? statusEntry,
  }) =>
      Datum(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        sectionId: sectionId ?? this.sectionId,
        questionValue: questionValue ?? this.questionValue,
        weightage: weightage ?? this.weightage,
        selfValueWeek: selfValueWeek ?? this.selfValueWeek,
        selfValue: selfValue ?? this.selfValue,
        level1Value: level1Value ?? this.level1Value,
        level2Value: level2Value ?? this.level2Value,
        totalValue: totalValue ?? this.totalValue,
        goalSelfSubmit: goalSelfSubmit ?? this.goalSelfSubmit,
        goalSelfSubmitDate: goalSelfSubmitDate ?? this.goalSelfSubmitDate,
        goalApprovalSubmit: goalApprovalSubmit ?? this.goalApprovalSubmit,
        goalApprovalSubmitDate:
            goalApprovalSubmitDate ?? this.goalApprovalSubmitDate,
        isDelete: isDelete ?? this.isDelete,
        selfSubmit: selfSubmit ?? this.selfSubmit,
        isApproval1: isApproval1 ?? this.isApproval1,
        isApproval2: isApproval2 ?? this.isApproval2,
        status: status ?? this.status,
        statusEntry: statusEntry ?? this.statusEntry,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        employeeId: json["employee_id"],
        sectionId: json["section_id"],
        questionValue: json["question_value"],
        weightage: json["weightage"],
        selfValueWeek: json["self_value_week"],
        selfValue: json["self_value"],
        level1Value: json["level1_value"],
        level2Value: json["level2_value"],
        totalValue: json["total_value"],
        goalSelfSubmit: json["goal_self_submit"],
        goalSelfSubmitDate: json["goal_self_submit_date"] == null
            ? null
            : DateTime.parse(json["goal_self_submit_date"]),
        goalApprovalSubmit: json["goal_approval_submit"],
        goalApprovalSubmitDate: json["goal_approval_submit_date"] == null
            ? null
            : DateTime.parse(json["goal_approval_submit_date"]),
        isDelete: json["is_delete"],
        selfSubmit: json["self_submit"],
        isApproval1: json["is_approval_1"],
        isApproval2: json["is_approval_2"],
        status: json["status"],
        statusEntry: json["status_entry"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_id": employeeId,
        "section_id": sectionId,
        "question_value": questionValue,
        "weightage": weightage,
        "self_value_week": selfValueWeek,
        "self_value": selfValue,
        "level1_value": level1Value,
        "level2_value": level2Value,
        "total_value": totalValue,
        "goal_self_submit": goalSelfSubmit,
        "goal_self_submit_date": goalSelfSubmitDate?.toIso8601String(),
        "goal_approval_submit": goalApprovalSubmit,
        "goal_approval_submit_date": goalApprovalSubmitDate?.toIso8601String(),
        "is_delete": isDelete,
        "self_submit": selfSubmit,
        "is_approval_1": isApproval1,
        "is_approval_2": isApproval2,
        "status": status,
        "status_entry": statusEntry,
      };
}
