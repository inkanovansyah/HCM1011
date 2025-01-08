import 'dart:convert';

class BossRequest {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  BossRequest({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory BossRequest.fromRawJson(String str) =>
      BossRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BossRequest.fromJson(Map<String, dynamic> json) => BossRequest(
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
  String? leaveStatus;
  DateTime? updatedAt;

  Data({
    this.leaveStatus,
    this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        leaveStatus: json["leave_status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "leave_status": leaveStatus,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
