import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home_events.dart';
import '../model/employee_details_response.dart';

class EmployeesDetailsScreen extends StatefulWidget {
  EmployeesDetailsResponse? response;
   EmployeesDetailsScreen({Key? key,required this.response}) : super(key: key);

  @override
  State<EmployeesDetailsScreen> createState() => _EmployeesDetailsScreenState();
}

class _EmployeesDetailsScreenState extends State<EmployeesDetailsScreen> {
  List<EmployeesDetailsResponse> employeesList=[];
  EmployeesDetailsResponse response=EmployeesDetailsResponse();
  @override
  void initState() {
    print("Inside emp-details::${widget.response.toString()}");
    response=widget.response!;
    _addEmployee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _addEmployee();
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("back")
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        color: Colors.white24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: employeesList.isNotEmpty?employeesList.length:0,
                          itemBuilder: (_,index){
                            return Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                      title: Text(employeesList[index].name??""),

                                      subtitle: Text(employeesList[index].job??""),

                                  ),
                                ],
                              ),
                            );
                          }
                      )

            ),

          ],
        ),
      ),
    );
  }
  _addEmployee(){
    // for(int i=0;i<=employeesList.length;i++){
    if(employeesList.isEmpty){
      employeesList.add(response);

    }
    // }
  }
}
