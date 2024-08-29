import 'dart:convert';

class ListtransaksiBooking {
  int? status;
  List<dynamic>? error;
  String? message;
  Data? data;

  ListtransaksiBooking({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory ListtransaksiBooking.fromRawJson(String str) =>
      ListtransaksiBooking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListtransaksiBooking.fromJson(Map<String, dynamic> json) =>
      ListtransaksiBooking(
        status: json["status"],
        error: json["error"] == null
            ? []
            : List<dynamic>.from(json["error"]!.map((x) => x)),
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error == null ? [] : List<dynamic>.from(error!.map((x) => x)),
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? employeeId;
  String? bookingmobilId;
  String? namaPengguna;
  String? deskripsi;
  String? isActive;
  DateTime? bookingStart;
  DateTime? bookingEnd;

  Data({
    this.employeeId,
    this.bookingmobilId,
    this.namaPengguna,
    this.deskripsi,
    this.isActive,
    this.bookingStart,
    this.bookingEnd,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        employeeId: json["employee_id"],
        bookingmobilId: json["bookingmobil_id"],
        namaPengguna: json["nama_pengguna"],
        deskripsi: json["Deskripsi"],
        isActive: json["is_active"],
        bookingStart: json["booking_start"] == null
            ? null
            : DateTime.parse(json["booking_start"]),
        bookingEnd: json["booking_end"] == null
            ? null
            : DateTime.parse(json["booking_end"]),
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "bookingmobil_id": bookingmobilId,
        "nama_pengguna": namaPengguna,
        "Deskripsi": deskripsi,
        "is_active": isActive,
        "booking_start": bookingStart?.toIso8601String(),
        "booking_end": bookingEnd?.toIso8601String(),
      };
}
