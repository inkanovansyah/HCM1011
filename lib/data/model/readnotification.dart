import 'dart:convert';

class AddNotification {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  AddNotification({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory AddNotification.fromRawJson(String str) =>
      AddNotification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddNotification.fromJson(Map<String, dynamic> json) =>
      AddNotification(
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
  int? isRead;
  DateTime? readAt;

  Data({
    this.isRead,
    this.readAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isRead: json["is_read"],
        readAt:
            json["read_at"] == null ? null : DateTime.parse(json["read_at"]),
      );

  Map<String, dynamic> toJson() => {
        "is_read": isRead,
        "read_at": readAt?.toIso8601String(),
      };
}
