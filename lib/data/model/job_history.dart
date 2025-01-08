import 'dart:convert';

class JobHistory {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  JobHistory({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory JobHistory.fromRawJson(String str) =>
      JobHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobHistory.fromJson(Map<String, dynamic> json) => JobHistory(
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
  String? employeeWorkExperienceId;
  String? employeeId;
  String? companyName;
  String? city;
  String? position;
  String? yearStart;
  String? yearEnd;
  String? isDelete;

  Datum({
    this.employeeWorkExperienceId,
    this.employeeId,
    this.companyName,
    this.city,
    this.position,
    this.yearStart,
    this.yearEnd,
    this.isDelete,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        employeeWorkExperienceId: json["employee_work_experience_id"],
        employeeId: json["employee_id"],
        companyName: json["company_name"],
        city: json["city"],
        position: json["position"],
        yearStart: json["year_start"],
        yearEnd: json["year_end"],
        isDelete: json["is_delete"],
      );

  Map<String, dynamic> toJson() => {
        "employee_work_experience_id": employeeWorkExperienceId,
        "employee_id": employeeId,
        "company_name": companyName,
        "city": city,
        "position": position,
        "year_start": yearStart,
        "year_end": yearEnd,
        "is_delete": isDelete,
      };
}
