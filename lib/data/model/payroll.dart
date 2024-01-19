import 'dart:convert';

class ModelDetailpayroll {
    int? status;
    dynamic error;
    String? messages;
    Data? data;

    ModelDetailpayroll({
        this.status,
        this.error,
        this.messages,
        this.data,
    });

    factory ModelDetailpayroll.fromRawJson(String str) => ModelDetailpayroll.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ModelDetailpayroll.fromJson(Map<String, dynamic> json) => ModelDetailpayroll(
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
    String? id;
    String? companyId;
    String? employeeId;
    dynamic norek;
    dynamic accountName;
    String? year;
    String? month;
    String? gajiPokok;
    String? gajiHari;
    String? tunjanganJabatan;
    String? uangMakan;
    String? uangTransport;
    String? hariKerja;
    String? hadir;
    String? tidakHadir;
    String? telat;
    String? ijin;
    String? sts;
    String? sds;
    String? cuti;
    String? lembur;
    String? wfh;
    String? totalUangMakan;
    String? totalUangTransport;
    String? totalLainLain;
    String? totalPenghasilan;
    String? potonganUnpaidLeave;
    String? potonganUangTransport;
    String? potonganBpjsTk;
    String? potonganBpjsKes;
    String? potonganTelat;
    String? potonganLainLain;
    String? potonganTotal;
    String? totalTerimaGaji;
    String? isDelete;
    dynamic deletedAt;
    DateTime? createdAt;
    dynamic updatedAt;

    Data({
        this.id,
        this.companyId,
        this.employeeId,
        this.norek,
        this.accountName,
        this.year,
        this.month,
        this.gajiPokok,
        this.gajiHari,
        this.tunjanganJabatan,
        this.uangMakan,
        this.uangTransport,
        this.hariKerja,
        this.hadir,
        this.tidakHadir,
        this.telat,
        this.ijin,
        this.sts,
        this.sds,
        this.cuti,
        this.lembur,
        this.wfh,
        this.totalUangMakan,
        this.totalUangTransport,
        this.totalLainLain,
        this.totalPenghasilan,
        this.potonganUnpaidLeave,
        this.potonganUangTransport,
        this.potonganBpjsTk,
        this.potonganBpjsKes,
        this.potonganTelat,
        this.potonganLainLain,
        this.potonganTotal,
        this.totalTerimaGaji,
        this.isDelete,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        companyId: json["company_id"],
        employeeId: json["employee_id"],
        norek: json["norek"],
        accountName: json["account_name"],
        year: json["year"],
        month: json["month"],
        gajiPokok: json["gaji_pokok"],
        gajiHari: json["gaji_hari"],
        tunjanganJabatan: json["tunjangan_jabatan"],
        uangMakan: json["uang_makan"],
        uangTransport: json["uang_transport"],
        hariKerja: json["hari_kerja"],
        hadir: json["hadir"],
        tidakHadir: json["tidak_hadir"],
        telat: json["telat"],
        ijin: json["ijin"],
        sts: json["sts"],
        sds: json["sds"],
        cuti: json["cuti"],
        lembur: json["lembur"],
        wfh: json["wfh"],
        totalUangMakan: json["total_uang_makan"],
        totalUangTransport: json["total_uang_transport"],
        totalLainLain: json["total_lain_lain"],
        totalPenghasilan: json["total_penghasilan"],
        potonganUnpaidLeave: json["potongan_unpaid_leave"],
        potonganUangTransport: json["potongan_uang_transport"],
        potonganBpjsTk: json["potongan_bpjs_tk"],
        potonganBpjsKes: json["potongan_bpjs_kes"],
        potonganTelat: json["potongan_telat"],
        potonganLainLain: json["potongan_lain_lain"],
        potonganTotal: json["potongan_total"],
        totalTerimaGaji: json["total_terima_gaji"],
        isDelete: json["is_delete"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "employee_id": employeeId,
        "norek": norek,
        "account_name": accountName,
        "year": year,
        "month": month,
        "gaji_pokok": gajiPokok,
        "gaji_hari": gajiHari,
        "tunjangan_jabatan": tunjanganJabatan,
        "uang_makan": uangMakan,
        "uang_transport": uangTransport,
        "hari_kerja": hariKerja,
        "hadir": hadir,
        "tidak_hadir": tidakHadir,
        "telat": telat,
        "ijin": ijin,
        "sts": sts,
        "sds": sds,
        "cuti": cuti,
        "lembur": lembur,
        "wfh": wfh,
        "total_uang_makan": totalUangMakan,
        "total_uang_transport": totalUangTransport,
        "total_lain_lain": totalLainLain,
        "total_penghasilan": totalPenghasilan,
        "potongan_unpaid_leave": potonganUnpaidLeave,
        "potongan_uang_transport": potonganUangTransport,
        "potongan_bpjs_tk": potonganBpjsTk,
        "potongan_bpjs_kes": potonganBpjsKes,
        "potongan_telat": potonganTelat,
        "potongan_lain_lain": potonganLainLain,
        "potongan_total": potonganTotal,
        "total_terima_gaji": totalTerimaGaji,
        "is_delete": isDelete,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
    };
}
