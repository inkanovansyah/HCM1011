import 'dart:convert';

class Applyleave {
  int? status;
  dynamic error;
  List<dynamic>? messages;
  Data? data;

  Applyleave({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory Applyleave.fromRawJson(String str) =>
      Applyleave.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Applyleave.fromJson(Map<String, dynamic> json) => Applyleave(
        status: json["status"],
        error: json["error"],
        messages: json["messages"] == null
            ? []
            : List<dynamic>.from(json["messages"]!.map((x) => x)),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "data": data?.toJson(),
      };
}

class Data {
  int? employeeId;
  int? subsId;
  String? letterNo;
  String? letterDate;
  int? leaveId;
  DateTime? dateStart;
  DateTime? dateEnd;
  String? notes;
  String? leaveStatus;

  Data({
    this.employeeId,
    this.subsId,
    this.letterNo,
    this.letterDate,
    this.leaveId,
    this.dateStart,
    this.dateEnd,
    this.notes,
    this.leaveStatus,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        employeeId: json["employee_id"],
        subsId: json["subs_id"],
        letterNo: json["letter_no"],
        letterDate: json["letter_date"],
        leaveId: json["leave_id"],
        dateStart: json["date_start"] == null
            ? null
            : DateTime.parse(json["date_start"]),
        dateEnd:
            json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
        notes: json["notes"],
        leaveStatus: json["leave_status"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "subs_id": subsId,
        "letter_no": letterNo,
        "letter_date": letterDate,
        "leave_id": leaveId,
        "date_start":
            "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
        "date_end":
            "${dateEnd!.year.toString().padLeft(4, '0')}-${dateEnd!.month.toString().padLeft(2, '0')}-${dateEnd!.day.toString().padLeft(2, '0')}",
        "notes": notes,
        "leave_status": leaveStatus,
      };
}
