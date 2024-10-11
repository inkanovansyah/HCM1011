import 'dart:convert';

class Replacement {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  Replacement({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory Replacement.fromRawJson(String str) =>
      Replacement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Replacement.fromJson(Map<String, dynamic> json) => Replacement(
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
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;

  Data({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"],
        perPage: json["perPage"],
        total: json["total"],
        totalPages: json["totalPages"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "perPage": perPage,
        "total": total,
        "totalPages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? nik;
  String? fullname;
  String? image;
  String? gender;
  String? departmentName;
  dynamic gradeName;
  String? positionName;
  String? levelName;

  Datum({
    this.nik,
    this.fullname,
    this.image,
    this.gender,
    this.departmentName,
    this.gradeName,
    this.positionName,
    this.levelName,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nik: json["nik"],
        fullname: json["fullname"],
        image: json["image"],
        gender: json["gender"],
        departmentName: json["department_name"],
        gradeName: json["grade_name"],
        positionName: json["position_name"],
        levelName: json["level_name"],
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "fullname": fullname,
        "image": image,
        "gender": gender,
        "department_name": departmentName,
        "grade_name": gradeName,
        "position_name": positionName,
        "level_name": levelName,
      };
}
