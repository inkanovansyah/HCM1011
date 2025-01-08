import 'dart:convert';

class ApplyAttandance {
  int? status;
  dynamic error;
  String? messages;
  int? data;

  ApplyAttandance({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory ApplyAttandance.fromRawJson(String str) =>
      ApplyAttandance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApplyAttandance.fromJson(Map<String, dynamic> json) =>
      ApplyAttandance(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data,
      };
}
