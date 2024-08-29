import 'dart:convert';

class ApplyRoom {
  int? status;
  dynamic error;
  List<dynamic>? messages;
  ApplyRoomData? data;

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
        messages: json["messages"] == null
            ? []
            : List<dynamic>.from(json["messages"]!.map((x) => x)),
        data:
            json["data"] == null ? null : ApplyRoomData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages":
            messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
        "data": data?.toJson(),
      };
}

class ApplyRoomData {
  int? status;
  String? msg;
  DataData? data;

  ApplyRoomData({
    this.status,
    this.msg,
    this.data,
  });

  factory ApplyRoomData.fromRawJson(String str) =>
      ApplyRoomData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApplyRoomData.fromJson(Map<String, dynamic> json) => ApplyRoomData(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class DataData {
  int? roomId;
  String? employeeId;
  String? roomValue;
  String? alias;
  DateTime? startDate;
  DateTime? endDate;

  DataData({
    this.roomId,
    this.employeeId,
    this.roomValue,
    this.alias,
    this.startDate,
    this.endDate,
  });

  factory DataData.fromRawJson(String str) =>
      DataData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
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
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
      };
}
