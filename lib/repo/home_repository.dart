import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../base_state.dart';
import '../home/home_events.dart';
import '../model/user_modal.dart';

class HomeRepository{
  Future<List<UserModel2>>getUsers()async{
    http.Response response = await http.get(Uri.parse("https://reqres.in/api/users/"));
    print(response.statusCode);
    if (response.statusCode == 200){
      // final jsondata = await rootBundle.loadString('assets/Json/UserDetails.json');
      final List result = jsonDecode(response.body);
      print(result);
      return result.map((e) => UserModel2.fromJson(e)).toList();
    //return response;
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}
