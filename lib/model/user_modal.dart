class UserModel2 {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  UserModel2({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

    factory UserModel2.fromJson(Map<String,dynamic>json){
    return UserModel2(id: json["id"], email: json["email"], first_name: json["first_name"]??"first name",
        last_name: json["last_name"]??"last name",
        avatar: json["avatar"]??"https://th.bing.com/th?q=Avatar+Emoji&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.1&pid=InlineBlock&mkt=en-IN&cc=IN&setlang=en&adlt=moderate&t=1&mw=247"
    );

  }
}