import 'dart:convert';

class ModelLeave {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  ModelLeave({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory ModelLeave.fromRawJson(String str) =>
      ModelLeave.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelLeave.fromJson(Map<String, dynamic> json) => ModelLeave(
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
  List<Map<String, String?>>? list;
  int? total;
  int? totalFilter;

  Data({
    this.list,
    this.total,
    this.totalFilter,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? []
            : List<Map<String, String?>>.from(json["list"]!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
        total: json["total"],
        totalFilter: json["totalFilter"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "total": total,
        "totalFilter": totalFilter,
      };
}
