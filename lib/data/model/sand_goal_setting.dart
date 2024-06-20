import 'dart:convert';

class SandGoalSetting {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  SandGoalSetting({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  SandGoalSetting copyWith({
    int? status,
    dynamic error,
    String? messages,
    Data? data,
  }) =>
      SandGoalSetting(
        status: status ?? this.status,
        error: error ?? this.error,
        messages: messages ?? this.messages,
        data: data ?? this.data,
      );

  factory SandGoalSetting.fromRawJson(String str) =>
      SandGoalSetting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SandGoalSetting.fromJson(Map<String, dynamic> json) =>
      SandGoalSetting(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data?.toJson(),
      };
}

class Data {
  String? employeeId;
  String? sectionId;
  String? questionValue;
  String? weightage;
  int? selfValue;
  int? level1Value;
  int? level2Value;
  int? totalValue;
  int? goalSelfSubmit;
  int? goalApprovalSubmit;
  DateTime? updatedAt;
  DateTime? goalSelfSubmitDate;
  DateTime? goalApprovalSubmitDate;

  Data({
    this.employeeId,
    this.sectionId,
    this.questionValue,
    this.weightage,
    this.selfValue,
    this.level1Value,
    this.level2Value,
    this.totalValue,
    this.goalSelfSubmit,
    this.goalApprovalSubmit,
    this.updatedAt,
    this.goalSelfSubmitDate,
    this.goalApprovalSubmitDate,
  });

  Data copyWith({
    String? employeeId,
    String? sectionId,
    String? questionValue,
    String? weightage,
    int? selfValue,
    int? level1Value,
    int? level2Value,
    int? totalValue,
    int? goalSelfSubmit,
    int? goalApprovalSubmit,
    DateTime? updatedAt,
    DateTime? goalSelfSubmitDate,
    DateTime? goalApprovalSubmitDate,
  }) =>
      Data(
        employeeId: employeeId ?? this.employeeId,
        sectionId: sectionId ?? this.sectionId,
        questionValue: questionValue ?? this.questionValue,
        weightage: weightage ?? this.weightage,
        selfValue: selfValue ?? this.selfValue,
        level1Value: level1Value ?? this.level1Value,
        level2Value: level2Value ?? this.level2Value,
        totalValue: totalValue ?? this.totalValue,
        goalSelfSubmit: goalSelfSubmit ?? this.goalSelfSubmit,
        goalApprovalSubmit: goalApprovalSubmit ?? this.goalApprovalSubmit,
        updatedAt: updatedAt ?? this.updatedAt,
        goalSelfSubmitDate: goalSelfSubmitDate ?? this.goalSelfSubmitDate,
        goalApprovalSubmitDate:
            goalApprovalSubmitDate ?? this.goalApprovalSubmitDate,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        employeeId: json["employee_id"],
        sectionId: json["section_id"],
        questionValue: json["question_value"],
        weightage: json["weightage"],
        selfValue: json["self_value"],
        level1Value: json["level1_value"],
        level2Value: json["level2_value"],
        totalValue: json["total_value"],
        goalSelfSubmit: json["goal_self_submit"],
        goalApprovalSubmit: json["goal_approval_submit"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        goalSelfSubmitDate: json["goal_self_submit_date"] == null
            ? null
            : DateTime.parse(json["goal_self_submit_date"]),
        goalApprovalSubmitDate: json["goal_approval_submit_date"] == null
            ? null
            : DateTime.parse(json["goal_approval_submit_date"]),
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "section_id": sectionId,
        "question_value": questionValue,
        "weightage": weightage,
        "self_value": selfValue,
        "level1_value": level1Value,
        "level2_value": level2Value,
        "total_value": totalValue,
        "goal_self_submit": goalSelfSubmit,
        "goal_approval_submit": goalApprovalSubmit,
        "updated_at": updatedAt?.toIso8601String(),
        "goal_self_submit_date": goalSelfSubmitDate?.toIso8601String(),
        "goal_approval_submit_date": goalApprovalSubmitDate?.toIso8601String(),
      };
}
