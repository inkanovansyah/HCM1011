import 'dart:convert';

class ApplyRoom {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  ApplyRoom({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory ApplyRoom.fromRawJson(String str) =>
      ApplyRoom.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApplyRoom.fromJson(Map<String, dynamic> json) => ApplyRoom(
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
  String? roomId;
  String? employeeId;
  String? roomValue;
  String? alias;
  DateTime? startDate;
  DateTime? endDate;

  Data({
    this.roomId,
    this.employeeId,
    this.roomValue,
    this.alias,
    this.startDate,
    this.endDate,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        roomId: json["room_id"],
        employeeId: json["employee_id"],
        roomValue: json["room_value"],
        alias: json["alias"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "employee_id": employeeId,
        "room_value": roomValue,
        "alias": alias,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
      };
}
