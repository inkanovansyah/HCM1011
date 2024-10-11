import 'dart:convert';

class ListtransaksiBooking {
  int? status;
  String? msg;
  List<Datum>? data;

  ListtransaksiBooking({
    this.status,
    this.msg,
    this.data,
  });

  factory ListtransaksiBooking.fromRawJson(String str) =>
      ListtransaksiBooking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListtransaksiBooking.fromJson(Map<String, dynamic> json) =>
      ListtransaksiBooking(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? bookingmobilId;
  String? employeeId;
  String? namaPengguna;
  String? deskripsi;
  DateTime? bookingStart;
  DateTime? bookingEnd;
  DateTime? createdAt;
  String? isActive;
  String? idTypeMobil;
  String? status;
  String? description;
  String? transmisi;
  String? bahanBakar;
  String? jenisChar;
  String? jumlahBangku;

  Datum({
    this.id,
    this.bookingmobilId,
    this.employeeId,
    this.namaPengguna,
    this.deskripsi,
    this.bookingStart,
    this.bookingEnd,
    this.createdAt,
    this.isActive,
    this.idTypeMobil,
    this.status,
    this.description,
    this.transmisi,
    this.bahanBakar,
    this.jenisChar,
    this.jumlahBangku,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        bookingmobilId: json["bookingmobil_id"],
        employeeId: json["employee_id"],
        namaPengguna: json["nama_pengguna"],
        deskripsi: json["Deskripsi"],
        bookingStart: json["booking_start"] == null
            ? null
            : DateTime.parse(json["booking_start"]),
        bookingEnd: json["booking_end"] == null
            ? null
            : DateTime.parse(json["booking_end"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        isActive: json["is_active"],
        idTypeMobil: json["id_type_mobil"],
        status: json["status"],
        description: json["description"],
        transmisi: json["transmisi"],
        bahanBakar: json["bahan_bakar"],
        jenisChar: json["jenis_char"],
        jumlahBangku: json["jumlah_bangku"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookingmobil_id": bookingmobilId,
        "employee_id": employeeId,
        "nama_pengguna": namaPengguna,
        "Deskripsi": deskripsi,
        "booking_start":
            "${bookingStart!.year.toString().padLeft(4, '0')}-${bookingStart!.month.toString().padLeft(2, '0')}-${bookingStart!.day.toString().padLeft(2, '0')}",
        "booking_end":
            "${bookingEnd!.year.toString().padLeft(4, '0')}-${bookingEnd!.month.toString().padLeft(2, '0')}-${bookingEnd!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "is_active": isActive,
        "id_type_mobil": idTypeMobil,
        "status": status,
        "description": description,
        "transmisi": transmisi,
        "bahan_bakar": bahanBakar,
        "jenis_char": jenisChar,
        "jumlah_bangku": jumlahBangku,
      };
}
