import 'dart:convert';

UpdateUserResponse updateUserResponseFromJson(String str) => UpdateUserResponse.fromJson(json.decode(str));

String updateUserResponseToJson(UpdateUserResponse data) => json.encode(data.toJson());

class UpdateUserResponse {
  UpdateUserResponse({
     this.name,
     this.job,
     this.updatedAt,
  });

  String? name;
  String? job;
  DateTime? updatedAt;

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) => UpdateUserResponse(
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