class UserModel2 {
  final String id;
  final String email;
  final String first_name;
  final String last_name;

  UserModel2({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
  });

    factory UserModel2.fromJson(Map<String,dynamic>json){
    return UserModel2(id: json["id"], email: json["email"], first_name: json["first_name"], last_name: json["last_name"]);

  }
}