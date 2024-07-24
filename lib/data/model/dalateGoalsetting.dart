import 'dart:convert';

class DalateGoalSetting {
  int? status;
  dynamic error;
  String? messages;
  List<dynamic>? data;

  DalateGoalSetting({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory DalateGoalSetting.fromRawJson(String str) =>
      DalateGoalSetting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DalateGoalSetting.fromJson(Map<String, dynamic> json) =>
      DalateGoalSetting(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
