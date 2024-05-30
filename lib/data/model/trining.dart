import 'dart:convert';

class ModelTrining {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  ModelTrining({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory ModelTrining.fromRawJson(String str) =>
      ModelTrining.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelTrining.fromJson(Map<String, dynamic> json) => ModelTrining(
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
  String? id;
  String? vendorId;
  String? employeeId;
  String? name;
  dynamic level;
  String? points;
  String? hasCertificate;
  DateTime? startDate;
  DateTime? endDate;
  String? isDelete;
  dynamic vendorName;

  Datum({
    this.id,
    this.vendorId,
    this.employeeId,
    this.name,
    this.level,
    this.points,
    this.hasCertificate,
    this.startDate,
    this.endDate,
    this.isDelete,
    this.vendorName,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        vendorId: json["vendor_id"],
        employeeId: json["employee_id"],
        name: json["name"],
        level: json["level"],
        points: json["points"],
        hasCertificate: json["has_certificate"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        isDelete: json["is_delete"],
        vendorName: json["vendor_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "employee_id": employeeId,
        "name": name,
        "level": level,
        "points": points,
        "has_certificate": hasCertificate,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "is_delete": isDelete,
        "vendor_name": vendorName,
      };
}
