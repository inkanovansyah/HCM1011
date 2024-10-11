import 'dart:convert';

class Typeofleave {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  Typeofleave({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory Typeofleave.fromRawJson(String str) =>
      Typeofleave.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Typeofleave.fromJson(Map<String, dynamic> json) => Typeofleave(
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
  List<ListElement>? list;
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
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
        total: json["total"],
        totalFilter: json["totalFilter"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "total": total,
        "totalFilter": totalFilter,
      };
}

class ListElement {
  String? id;
  String? companyId;
  String? name;
  String? formula;
  String? total;
  String? isDelete;
  DateTime? createdAt;
  DateTime? updateAt;

  ListElement({
    this.id,
    this.companyId,
    this.name,
    this.formula,
    this.total,
    this.isDelete,
    this.createdAt,
    this.updateAt,
  });

  factory ListElement.fromRawJson(String str) =>
      ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        companyId: json["company_id"],
        name: json["name"],
        formula: json["formula"],
        total: json["total"],
        isDelete: json["is_delete"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updateAt: json["update_at"] == null
            ? null
            : DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "name": name,
        "formula": formula,
        "total": total,
        "is_delete": isDelete,
        "created_at": createdAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),
      };
}
