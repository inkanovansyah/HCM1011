import 'dart:convert';

class ListBooking {
  int? status;
  String? error;
  String? message;
  List<Datum>? data;

  ListBooking({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory ListBooking.fromRawJson(String str) =>
      ListBooking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListBooking.fromJson(Map<String, dynamic> json) => ListBooking(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? idTypeMobil;
  String? status;
  String? isActive;
  String? description;
  String? transmisi;
  String? bahanBakar;
  String? jenisChar;
  String? jumlahBangku;
  String? nama;
  String? deskripsi;
  String? licensePlate;

  Datum({
    this.id,
    this.idTypeMobil,
    this.status,
    this.isActive,
    this.description,
    this.transmisi,
    this.bahanBakar,
    this.jenisChar,
    this.jumlahBangku,
    this.nama,
    this.deskripsi,
    this.licensePlate,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idTypeMobil: json["id_type_mobil"],
        status: json["status"],
        isActive: json["is_active"],
        description: json["description"],
        transmisi: json["transmisi"],
        bahanBakar: json["bahan_bakar"],
        jenisChar: json["jenis_char"],
        jumlahBangku: json["jumlah_bangku"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        licensePlate: json["LicensePlate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_type_mobil": idTypeMobil,
        "status": status,
        "is_active": isActive,
        "description": description,
        "transmisi": transmisi,
        "bahan_bakar": bahanBakar,
        "jenis_char": jenisChar,
        "jumlah_bangku": jumlahBangku,
        "nama": nama,
        "deskripsi": deskripsi,
        "LicensePlate": licensePlate,
      };
}
