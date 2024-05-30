import 'dart:convert';

class InsertStory {
  int? status;
  List<dynamic>? error;
  String? message;
  bool? data;

  InsertStory({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory InsertStory.fromRawJson(String str) =>
      InsertStory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InsertStory.fromJson(Map<String, dynamic> json) => InsertStory(
        status: json["status"],
        error: json["error"] == null
            ? []
            : List<dynamic>.from(json["error"]!.map((x) => x)),
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error == null ? [] : List<dynamic>.from(error!.map((x) => x)),
        "message": message,
        "data": data,
      };
}
