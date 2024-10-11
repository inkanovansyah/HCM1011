import 'dart:convert';

class ModalSaldo {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  ModalSaldo({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory ModalSaldo.fromRawJson(String str) =>
      ModalSaldo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModalSaldo.fromJson(Map<String, dynamic> json) => ModalSaldo(
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
  dynamic leaveId;
  dynamic employeeId;
  dynamic totalAmbil;
  dynamic jatah;
  dynamic sisa;

  Data({
    this.leaveId,
    this.employeeId,
    this.totalAmbil,
    this.jatah,
    this.sisa,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        leaveId: json["leave_id"],
        employeeId: json["employee_id"],
        totalAmbil: json["total_ambil"],
        jatah: json["jatah"],
        sisa: json["sisa"],
      );

  Map<String, dynamic> toJson() => {
        "leave_id": leaveId,
        "employee_id": employeeId,
        "total_ambil": totalAmbil,
        "jatah": jatah,
        "sisa": sisa,
      };
}
