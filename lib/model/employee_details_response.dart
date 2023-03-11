import 'dart:convert';

EmployeesDetailsResponse employeesDetailsResponseFromJson(String str) => EmployeesDetailsResponse.fromJson(json.decode(str));

String employeesDetailsResponseToJson(EmployeesDetailsResponse data) => json.encode(data.toJson());

class EmployeesDetailsResponse {
  EmployeesDetailsResponse({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  String? name;
  String? job;
  String? id;
  DateTime? createdAt;

  factory EmployeesDetailsResponse.fromJson(Map<String, dynamic> json) => EmployeesDetailsResponse(
    name: json["name"],
    job: json["job"],
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt,
  };
}