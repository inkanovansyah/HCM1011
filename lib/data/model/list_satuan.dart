import 'dart:convert';

class ListSatuan {
  int? status;
  dynamic error;
  List<dynamic>? messages;
  List<Datum>? data;

  ListSatuan({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory ListSatuan.fromRawJson(String str) =>
      ListSatuan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListSatuan.fromJson(Map<String, dynamic> json) => ListSatuan(
        status: json["status"],
        error: json["error"],
        messages: json["messages"] == null
            ? []
            : List<dynamic>.from(json["messages"]!.map((x) => x)),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? name;

  Datum({
    this.id,
    this.name,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
