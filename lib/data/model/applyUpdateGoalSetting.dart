import 'dart:convert';

class SandUpdateGoalSetting {
  int status;
  dynamic error;
  String messages;
  SandUpdateGoalSettingData? data;

  SandUpdateGoalSetting({
    required this.status,
    required this.error,
    required this.messages,
    required this.data,
  });

  SandUpdateGoalSetting copyWith({
    int? status,
    dynamic error,
    String? messages,
    SandUpdateGoalSettingData? data,
  }) =>
      SandUpdateGoalSetting(
        status: status ?? this.status,
        error: error ?? this.error,
        messages: messages ?? this.messages,
        data: data ?? this.data,
      );

  factory SandUpdateGoalSetting.fromRawJson(String str) =>
      SandUpdateGoalSetting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SandUpdateGoalSetting.fromJson(Map<String, dynamic> json) =>
      SandUpdateGoalSetting(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: SandUpdateGoalSettingData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data?.toJson(),
      };
}

class SandUpdateGoalSettingData {
  int status;
  String msg;
  DataData data;

  SandUpdateGoalSettingData({
    required this.status,
    required this.msg,
    required this.data,
  });

  SandUpdateGoalSettingData copyWith({
    int? status,
    String? msg,
    DataData? data,
  }) =>
      SandUpdateGoalSettingData(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory SandUpdateGoalSettingData.fromRawJson(String str) =>
      SandUpdateGoalSettingData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SandUpdateGoalSettingData.fromJson(Map<String, dynamic> json) =>
      SandUpdateGoalSettingData(
        status: json["status"],
        msg: json["msg"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class DataData {
  String selfValue;
  DateTime updatedAt;
  String selfValueWeek;
  String level1Value;
  String weightage;
  String questionValue;

  DataData({
    required this.selfValue,
    required this.updatedAt,
    required this.selfValueWeek,
    required this.level1Value,
    required this.weightage,
    required this.questionValue,
  });

  DataData copyWith({
    String? selfValue,
    DateTime? updatedAt,
    String? selfValueWeek,
    String? level1Value,
    String? weightage,
    String? questionValue,
  }) =>
      DataData(
        selfValue: selfValue ?? this.selfValue,
        updatedAt: updatedAt ?? this.updatedAt,
        selfValueWeek: selfValueWeek ?? this.selfValueWeek,
        level1Value: level1Value ?? this.level1Value,
        weightage: weightage ?? this.weightage,
        questionValue: questionValue ?? this.questionValue,
      );

  factory DataData.fromRawJson(String str) =>
      DataData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        selfValue: json["self_value"],
        updatedAt: DateTime.parse(json["updated_at"]),
        selfValueWeek: json["self_value_week"],
        level1Value: json["level1_value"],
        weightage: json["weightage"],
        questionValue: json["question_value"],
      );

  Map<String, dynamic> toJson() => {
        "self_value": selfValue,
        "updated_at": updatedAt.toIso8601String(),
        "self_value_week": selfValueWeek,
        "level1_value": level1Value,
        "weightage": weightage,
        "question_value": questionValue,
      };
}
