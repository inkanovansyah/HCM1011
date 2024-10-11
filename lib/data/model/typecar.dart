import 'dart:convert';

class TypeCarList {
  int? status;
  String? msg;
  List<Datum>? data;

  TypeCarList({
    this.status,
    this.msg,
    this.data,
  });

  factory TypeCarList.fromRawJson(String str) =>
      TypeCarList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypeCarList.fromJson(Map<String, dynamic> json) => TypeCarList(
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
  String? nama;
  String? deskripsi;
  String? licensePlate;

  Datum({
    this.id,
    this.nama,
    this.deskripsi,
    this.licensePlate,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        licensePlate: json["LicensePlate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "LicensePlate": licensePlate,
      };
}
