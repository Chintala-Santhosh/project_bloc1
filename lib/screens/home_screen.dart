import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc1/blocsfolder/home_bloc.dart';
import 'package:project_bloc1/model/employee_request_model.dart';
import 'package:project_bloc1/model/user_modal.dart';

import '../base_state.dart';
import '../home/home_events.dart';
import '../model/employee_details_response.dart';
import '../model/update_employee_response_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc _bloc = HomeBloc(initialState: Loading());
  List<UserModel2> usersList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  EmployeesDetailsResponse response = EmployeesDetailsResponse();
  UpdateEmployeeResponse updateUserResponse = UpdateEmployeeResponse();
  List<EmployeesDetailsResponse> employeesList = [];
  List<UpdateEmployeeResponse> updatedEmployeesList = [];
  bool isAdd = false;
  String? deleteData;
  int listIndex = 0;

  @override
  void initState() {
    _bloc.add(GetUserDetails());

    super.initState();
  }

  _callAddEmployeeAPI() {
    EmployeeRequestModel request = EmployeeRequestModel();
    request.name = nameController.text;
    request.job = jobController.text;
    _bloc.add(AddEmployeesDetails(request: request));
  }

  _callUpdateEmployeeAPI(EmployeesDetailsResponse employeesList) {
    employeesList.name = nameController.text;
    employeesList.job = jobController.text;
    EmployeeRequestModel request = EmployeeRequestModel();
    request.name = employeesList.name;
    request.job = employeesList.job;
    _bloc.add(UpdateEmployeesDetails(request: request));
  }

  _callDeleteEmployeeAPI() {
    _bloc.add(DeleteEmployeesDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Employee Details"),
            GestureDetector(
              child: Row(
                children: const [
                  Text("+"),
                  Text("Add Employee"),
                ],
              ),
              onTap: () {
                isAdd = true;
                // employeeDialog(employeesList[0]);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: Column(
                        children: [
                          Text("Employee Name"),
                          Container(
                            color: Colors.transparent,
                            child: TextField(
                              controller: nameController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Employee Job Role"),
                          Container(
                            child: TextField(
                              controller: jobController,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 30, right: 30),
                              child: Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blue,
                            ),
                            onTap: () async {
                              await _callAddEmployeeAPI();
                              nameController.clear();
                              jobController.clear();
                              print(
                                  "inside add-emp-details${response.toString()}");
                              Navigator.pop(context);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeesDetailsScreen(response: response,)));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => _bloc,
        child: BlocBuilder<HomeBloc, BaseState>(builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DataLoaded) {
            if (state.event == "AddEmployeesDetails") {
              response = state.data;
              employeesList.add(response);
              print(employeesList);
            }
            if (state.event == "UpdateEmployeesDetails") {
              updateUserResponse = state.data;
              updatedEmployeesList.add(updateUserResponse);
              print(updatedEmployeesList);
            }
            if (state.event == "DeleteEmployeesDetails") {
              deleteData = state.data;
              if (state.data == "") {
                employeesList.remove(employeesList[listIndex]);
              }
              // _deleteEmployeesDetails(index!);
              print(deleteData);
            }
          }
          if (state is Error) {
            return Center(
              child: Text('error'),
            );
          }
          return employeesList.length>0
              ?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child:
                // FutureBuilder<AddEmployeesDetails>(
                // future:null,
                // builder: ((context,data){
                //   return
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: employeesList.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 20, top: 20),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(employeesList[index].name ?? ""),
                                  Text(employeesList[index].job ?? ""),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.delete,
                                      size: 25,
                                    ),
                                    onTap: () async {
                                      await _callDeleteEmployeeAPI();
                                      listIndex = index;
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.edit,
                                      size: 25,
                                    ),
                                    onTap: () {
                                      isAdd = false;
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // return object of type Dialog
                                            return AlertDialog(
                                              title: Column(
                                                children: [
                                                  Text("Employee Name"),
                                                  Container(
                                                    color:
                                                    Colors.transparent,
                                                    child: TextField(
                                                      controller:
                                                      nameController,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("Employee Job Role"),
                                                  Container(
                                                    child: TextField(
                                                      controller:
                                                      jobController,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  GestureDetector(
                                                    child: Container(
                                                      padding:
                                                      EdgeInsets.only(
                                                          top: 4,
                                                          bottom: 4,
                                                          left: 30,
                                                          right: 30),
                                                      child: Text(
                                                        isAdd
                                                            ? "Add"
                                                            : "Update",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .white),
                                                      ),
                                                      color: Colors.blue,
                                                    ),
                                                    onTap: () async {
                                                      // isAdd? await _callAddEmployeeAPI():
                                                      await _callUpdateEmployeeAPI(
                                                          employeesList[
                                                          index]);
                                                      nameController
                                                          .clear();
                                                      jobController.clear();
                                                      print(
                                                          "inside Update-emp-details${response.toString()}");
                                                      Navigator.pop(
                                                          context);
                                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeesDetailsScreen(response: response,)));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  // );
                  // }
                  // )
                ),
                onTap: () {},
              ),
            ],
          )
              :Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/no_employees.jpg"),
                  SizedBox(height: 20,),
                  Text("Add Employees",style: TextStyle(
                      fontSize: 25
                  ),)
                ],
              ),
            ),
          );
          return Container();
        }),
      ),
    );
  }
}
