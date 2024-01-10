import 'dart:convert';

class ModelDetailKpi {
  int? status;
  dynamic error;
  String? messages;
  Data? data;
  String? log;

  ModelDetailKpi({
    this.status,
    this.error,
    this.messages,
    this.data,
    this.log,
  });

  factory ModelDetailKpi.fromRawJson(String str) =>
      ModelDetailKpi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelDetailKpi.fromJson(Map<String, dynamic> json) => ModelDetailKpi(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        log: json["log"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "data": data?.toJson(),
        "log": log,
      };
}

class Data {
  List<Datum>? data;

  Data({
    this.data,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? sectionId;
  String? companyId;
  String? levelId;
  String? name;
  DateTime? startDate;
  DateTime? endDate;
  String? isActive;
  String? isDelete;
  List<Progress>? progress;

  Datum({
    this.id,
    this.sectionId,
    this.companyId,
    this.levelId,
    this.name,
    this.startDate,
    this.endDate,
    this.isActive,
    this.isDelete,
    this.progress,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sectionId: json["section_id"],
        companyId: json["company_id"],
        levelId: json["level_id"],
        name: json["name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        isActive: json["is_active"],
        isDelete: json["is_delete"],
        progress: json["progress"] == null
            ? []
            : List<Progress>.from(
                json["progress"]!.map((x) => Progress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "section_id": sectionId,
        "company_id": companyId,
        "level_id": levelId,
        "name": name,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "is_active": isActive,
        "is_delete": isDelete,
        "progress": progress == null
            ? []
            : List<dynamic>.from(progress!.map((x) => x.toJson())),
      };
}

class Progress {
  String? status;
  int? progress;
  String? bgColor;
  String? statusDesc;
  String? employee;
  String? position;

  Progress({
    this.status,
    this.progress,
    this.bgColor,
    this.statusDesc,
    this.employee,
    this.position,
  });

  factory Progress.fromRawJson(String str) =>
      Progress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        status: json["status"],
        progress: json["progress"],
        bgColor: json["bg_color"],
        statusDesc: json["status_desc"],
        employee: json["employee"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "progress": progress,
        "bg_color": bgColor,
        "status_desc": statusDesc,
        "employee": employee,
        "position": position,
      };
}
