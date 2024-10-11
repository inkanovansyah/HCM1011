import 'dart:convert';

class AddTrining {
  int? status;
  dynamic error;
  String? messages;
  int? data;

  AddTrining({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory AddTrining.fromRawJson(String str) =>
      AddTrining.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddTrining.fromJson(Map<String, dynamic> json) => AddTrining(
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
