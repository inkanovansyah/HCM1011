import 'dart:convert';

class Authlogin {
  int? status;
  dynamic error;
  String? messages;
  Data? data;

  Authlogin({
    this.status,
    this.error,
    this.messages,
    this.data,
  });

  factory Authlogin.fromRawJson(String str) =>
      Authlogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Authlogin.fromJson(Map<String, dynamic> json) => Authlogin(
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
  String? token;
  Detail? detail;

  Data({
    this.token,
    this.detail,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "detail": detail?.toJson(),
      };
}

class Detail {
  String? email;
  String? loginId;
  String? groupId;
  String? groupName;
  String? employeeId;
  String? nik;
  String? fullname;
  String? image;
  String? companyId;
  String? companyName;
  String? deptId;
  String? deptName;
  String? deptCodeName;
  String? positionId;
  String? positionName;
  String? gradeId;
  dynamic score;
  String? levelId;
  String? levelName;
  String? statusId;
  String? statusName;
  String? gender;
  String? pob;
  DateTime? dob;
  String? maritalStatus;

  Detail({
    this.email,
    this.loginId,
    this.groupId,
    this.groupName,
    this.employeeId,
    this.nik,
    this.fullname,
    this.image,
    this.companyId,
    this.companyName,
    this.deptId,
    this.deptName,
    this.deptCodeName,
    this.positionId,
    this.positionName,
    this.gradeId,
    this.score,
    this.levelId,
    this.levelName,
    this.statusId,
    this.statusName,
    this.gender,
    this.pob,
    this.dob,
    this.maritalStatus,
  });

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        email: json["email"],
        loginId: json["login_id"],
        groupId: json["group_id"],
        groupName: json["group_name"],
        employeeId: json["employee_id"],
        nik: json["nik"],
        fullname: json["fullname"],
        image: json["image"],
        companyId: json["company_id"],
        companyName: json["company_name"],
        deptId: json["dept_id"],
        deptName: json["dept_name"],
        deptCodeName: json["dept_code_name"],
        positionId: json["position_id"],
        positionName: json["position_name"],
        gradeId: json["grade_id"],
        score: json["score"],
        levelId: json["level_id"],
        levelName: json["level_name"],
        statusId: json["status_id"],
        statusName: json["status_name"],
        gender: json["gender"],
        pob: json["pob"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        maritalStatus: json["marital_status"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "login_id": loginId,
        "group_id": groupId,
        "group_name": groupName,
        "employee_id": employeeId,
        "nik": nik,
        "fullname": fullname,
        "image": image,
        "company_id": companyId,
        "company_name": companyName,
        "dept_id": deptId,
        "dept_name": deptName,
        "dept_code_name": deptCodeName,
        "position_id": positionId,
        "position_name": positionName,
        "grade_id": gradeId,
        "score": score,
        "level_id": levelId,
        "level_name": levelName,
        "status_id": statusId,
        "status_name": statusName,
        "gender": gender,
        "pob": pob,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "marital_status": maritalStatus,
      };
}
