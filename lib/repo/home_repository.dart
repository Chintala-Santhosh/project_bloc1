import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_bloc1/model/update_employee_response_model.dart';
import 'package:project_bloc1/model/employee_request_model.dart';
import '../app_logs.dart';
import '../model/employee_details_response.dart';
import '../model/user_modal.dart';

class HomeRepository{
  Future<List<UserModel2>> getUsers()async{
    http.Response response = await http.get(Uri.parse("https://reqres.in/api/users/"));
    print("statusCode::${response.statusCode}");
    if (response.statusCode == 200){
      final List result = jsonDecode(response.body)["data"];
      AppLog.d("Response::${result.toString()}");
      return result.map((e) => UserModel2.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

  Future<EmployeesDetailsResponse> addEmployeesDetails(EmployeeRequestModel request)async{
    http.Response response = await http.post(Uri.parse("https://reqres.in/api/users/"),body: request.toJson());
    print("statusCode::${response.statusCode}");
    if (response.statusCode == 201){
      var result = jsonDecode(response.body);
      AppLog.d("Response::${result.toString()}");
      return EmployeesDetailsResponse.fromJson(result);
    }else{
      throw Exception(response.reasonPhrase);
    }

  }
  Future<UpdateEmployeeResponse> updateEmployees(EmployeeRequestModel request)async{
    http.Response response = await http.put(Uri.parse("https://reqres.in/api/users/2"),body: request.toJson());
    print("statusCode::${response.statusCode}");
    if (response.statusCode == 200){
      var result = jsonDecode(response.body);
      AppLog.d("Response::${result.toString()}");
      return UpdateEmployeeResponse.fromJson(result);
    }else{
      throw Exception(response.reasonPhrase);
    }

  }
  Future<String> deleteEmployees()async{
    http.Response response = await http.delete(Uri.parse("https://reqres.in/api/users/2"));
    print("statusCode::${response.statusCode}");
    if (response.statusCode == 204){
      AppLog.d("Response::${http.StreamedResponse}");
      var result = (response.body);
      return result;
    }else{
      throw Exception(response.reasonPhrase);
    }

  }
}
