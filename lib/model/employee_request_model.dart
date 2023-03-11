import 'dart:convert';

EmployeeRequestModel employeeRequestModelFromJson(String str) => EmployeeRequestModel.fromJson(json.decode(str));

String employeeRequestModelToJson(EmployeeRequestModel data) => json.encode(data.toJson());

class EmployeeRequestModel {
  EmployeeRequestModel({
     this.name,
     this.job,
  });

  String? name;
  String? job;

  factory EmployeeRequestModel.fromJson(Map<String, dynamic> json) => EmployeeRequestModel(
    name: json["name"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
  };
}