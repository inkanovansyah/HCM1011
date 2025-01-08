import 'dart:convert';

class BossRequest {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  BossRequest({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory BossRequest.fromRawJson(String str) =>
      BossRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BossRequest.fromJson(Map<String, dynamic> json) => BossRequest(
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
  String? leaveId;
  String? leaveName;
  String? leaveMax;
  String? letterNo;
  String? letterDate;
  String? notes;
  DateTime? dateStart;
  DateTime? dateEnd;
  String? leaveTotal;
  String? leaveStatus;
  String? employeeId;
  String? subsId;
  String? deptId;
  String? deptName;
  String? fullName;

  ListElement({
    this.id,
    this.leaveId,
    this.leaveName,
    this.leaveMax,
    this.letterNo,
    this.letterDate,
    this.notes,
    this.dateStart,
    this.dateEnd,
    this.leaveTotal,
    this.leaveStatus,
    this.employeeId,
    this.subsId,
    this.deptId,
    this.deptName,
    this.fullName,
  });

  factory ListElement.fromRawJson(String str) =>
      ListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        leaveId: json["leave_id"],
        leaveName: json["leave_name"],
        leaveMax: json["leave_max"],
        letterNo: json["letter_no"],
        letterDate: json["letter_date"],
        notes: json["notes"],
        dateStart: json["date_start"] == null
            ? null
            : DateTime.parse(json["date_start"]),
        dateEnd:
            json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
        leaveTotal: json["leave_total"],
        leaveStatus: json["leave_status"],
        employeeId: json["employee_id"],
        subsId: json["subs_id"],
        deptId: json["dept_id"],
        deptName: json["dept_name"],
        fullName: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "leave_id": leaveId,
        "leave_name": leaveName,
        "leave_max": leaveMax,
        "letter_no": letterNo,
        "letter_date": letterDate,
        "notes": notes,
        "date_start":
            "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
        "date_end":
            "${dateEnd!.year.toString().padLeft(4, '0')}-${dateEnd!.month.toString().padLeft(2, '0')}-${dateEnd!.day.toString().padLeft(2, '0')}",
        "leave_total": leaveTotal,
        "leave_status": leaveStatus,
        "employee_id": employeeId,
        "subs_id": subsId,
        "dept_id": deptId,
        "dept_name": deptName,
        "fullname": fullName,
      };
}
