import 'dart:convert';

UpdateUserRequest updateUserRequestFromJson(String str) => UpdateUserRequest.fromJson(json.decode(str));

String updateUserRequestToJson(UpdateUserRequest data) => json.encode(data.toJson());

class UpdateUserRequest {
  UpdateUserRequest({
     this.name,
     this.job,
  });

  String? name;
  String? job;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) => UpdateUserRequest(
    name: json["name"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
  };
}