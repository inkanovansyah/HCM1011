import 'dart:convert';

class BookingRoom {
  int? status;
  dynamic error;
  List<dynamic>? messages;
  Data? data;

  BookingRoom({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory BookingRoom.fromRawJson(String str) =>
      BookingRoom.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingRoom.fromJson(Map<String, dynamic> json) => BookingRoom(
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
  int? page;
  int? perPage;
  int? totalPages;
  int? total;
  List<Datum>? data;

  Data({
    this.page,
    this.perPage,
    this.totalPages,
    this.total,
    this.data,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"],
        perPage: json["perPage"],
        totalPages: json["totalPages"],
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "perPage": perPage,
        "totalPages": totalPages,
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? roomId;
  String? name;
  String? alias;
  String? roomValue;
  DateTime? startDate;
  DateTime? endDate;

  Datum({
    this.id,
    this.roomId,
    this.name,
    this.alias,
    this.roomValue,
    this.startDate,
    this.endDate,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        roomId: json["room_id"],
        name: json["name"],
        alias: json["alias"],
        roomValue: json["room_value"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "room_id": roomId,
        "name": name,
        "alias": alias,
        "room_value": roomValue,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
      };
}
