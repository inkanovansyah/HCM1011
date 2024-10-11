import 'dart:convert';

class SandGoalSetting {
  int status;
  dynamic error;
  String messages;
  Data data;

  SandGoalSetting({
    required this.status,
    required this.error,
    required this.messages,
    required this.data,
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
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String employeeId;
  String sectionId;
  String questionValue;
  String weightage;
  dynamic selfValueWeek;
  String selfValue;
  String level1Value;
  String level2Value;
  String totalValue;
  String isDelete;
  String goalSelfSubmit;
  DateTime goalSelfSubmitDate;
  String goalApprovalSubmit;
  DateTime goalApprovalSubmitDate;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String selfSubmit;
  dynamic selfSubmitDate;
  String isApproval1;
  dynamic approval1Date;
  String isApproval2;
  dynamic approval2Date;

  Data({
    required this.id,
    required this.employeeId,
    required this.sectionId,
    required this.questionValue,
    required this.weightage,
    required this.selfValueWeek,
    required this.selfValue,
    required this.level1Value,
    required this.level2Value,
    required this.totalValue,
    required this.isDelete,
    required this.goalSelfSubmit,
    required this.goalSelfSubmitDate,
    required this.goalApprovalSubmit,
    required this.goalApprovalSubmitDate,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.selfSubmit,
    required this.selfSubmitDate,
    required this.isApproval1,
    required this.approval1Date,
    required this.isApproval2,
    required this.approval2Date,
  });

  Data copyWith({
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
    String? isDelete,
    String? goalSelfSubmit,
    DateTime? goalSelfSubmitDate,
    String? goalApprovalSubmit,
    DateTime? goalApprovalSubmitDate,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? selfSubmit,
    dynamic selfSubmitDate,
    String? isApproval1,
    dynamic approval1Date,
    String? isApproval2,
    dynamic approval2Date,
  }) =>
      Data(
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
        isDelete: isDelete ?? this.isDelete,
        goalSelfSubmit: goalSelfSubmit ?? this.goalSelfSubmit,
        goalSelfSubmitDate: goalSelfSubmitDate ?? this.goalSelfSubmitDate,
        goalApprovalSubmit: goalApprovalSubmit ?? this.goalApprovalSubmit,
        goalApprovalSubmitDate:
            goalApprovalSubmitDate ?? this.goalApprovalSubmitDate,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        selfSubmit: selfSubmit ?? this.selfSubmit,
        selfSubmitDate: selfSubmitDate ?? this.selfSubmitDate,
        isApproval1: isApproval1 ?? this.isApproval1,
        approval1Date: approval1Date ?? this.approval1Date,
        isApproval2: isApproval2 ?? this.isApproval2,
        approval2Date: approval2Date ?? this.approval2Date,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        isDelete: json["is_delete"],
        goalSelfSubmit: json["goal_self_submit"],
        goalSelfSubmitDate: DateTime.parse(json["goal_self_submit_date"]),
        goalApprovalSubmit: json["goal_approval_submit"],
        goalApprovalSubmitDate:
            DateTime.parse(json["goal_approval_submit_date"]),
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        selfSubmit: json["self_submit"],
        selfSubmitDate: json["self_submit_date"],
        isApproval1: json["is_approval_1"],
        approval1Date: json["approval_1_date"],
        isApproval2: json["is_approval_2"],
        approval2Date: json["approval_2_date"],
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
        "is_delete": isDelete,
        "goal_self_submit": goalSelfSubmit,
        "goal_self_submit_date": goalSelfSubmitDate.toIso8601String(),
        "goal_approval_submit": goalApprovalSubmit,
        "goal_approval_submit_date": goalApprovalSubmitDate.toIso8601String(),
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "self_submit": selfSubmit,
        "self_submit_date": selfSubmitDate,
        "is_approval_1": isApproval1,
        "approval_1_date": approval1Date,
        "is_approval_2": isApproval2,
        "approval_2_date": approval2Date,
      };
}
