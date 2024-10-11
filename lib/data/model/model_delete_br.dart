import 'dart:convert';

class ApplyDeleteRoom {
  int? status;
  dynamic error;
  String? messages;
  List<dynamic>? data;

  ApplyDeleteRoom({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory ApplyDeleteRoom.fromRawJson(String str) =>
      ApplyDeleteRoom.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApplyDeleteRoom.fromJson(Map<String, dynamic> json) =>
      ApplyDeleteRoom(
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
