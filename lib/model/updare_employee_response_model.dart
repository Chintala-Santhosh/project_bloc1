import 'dart:convert';

UpdateEmployeeResponse updateEmployeeResponseFromJson(String str) => UpdateEmployeeResponse.fromJson(json.decode(str));

String updateEmployeeResponseToJson(UpdateEmployeeResponse data) => json.encode(data.toJson());

class UpdateEmployeeResponse {
  UpdateEmployeeResponse({
     this.name,
     this.job,
     this.updatedAt,
  });

  String? name;
  String? job;
  DateTime? updatedAt;

  factory UpdateEmployeeResponse.fromJson(Map<String, dynamic> json) => UpdateEmployeeResponse(
    name: json["name"],
    job: json["job"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "updatedAt": updatedAt,
  };
}