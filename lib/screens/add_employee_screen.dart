import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc1/screens/employees_details_screen.dart';

import '../base_state.dart';
import '../blocsfolder/home_bloc.dart';
import '../home/home_events.dart';
import '../model/employee_details_response.dart';
import '../model/updare_user_response_model.dart';
import '../model/update_user_request_model.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final HomeBloc _bloc =  HomeBloc(initialState: Loading());
  TextEditingController nameController=TextEditingController();
  TextEditingController jobController=TextEditingController();
  EmployeesDetailsResponse response= EmployeesDetailsResponse();

  _callAddEmployeeAPI(){
    UpdateUserRequest request=UpdateUserRequest();
    request.name=nameController.text;
    request.job=jobController.text;
    _bloc.add(AddEmployeesDetails(request: request));
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _bloc,
        child: BlocBuilder<HomeBloc,BaseState>(builder: (context,state){
          // if( state is Loading){
          //   return const Center(child: CircularProgressIndicator(),);
          // }
          if(state is DataLoaded){
            if(state.event=="AddEmployeesDetails"){
              response=state.data;
              print("nameee::${response.name}${response.job}");
            }

          }
          if(state is Error) {
            return Center(child: Text('error'),);
          }
          return Scaffold(
            body: Container(
              margin: EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Employee Name"),
                    Container(
                      color: Colors.transparent,
                      child: TextField(
                        controller: nameController,
                      ),
                    ),
                    SizedBox(height: 20,),

                    Text("Employee Job Role"),

                    Container(
                      child: TextField(
                        controller: jobController,
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(top: 4,bottom: 4,left: 30,right: 30),
                          child: Text("Add",style: TextStyle(color: Colors.white),),
                        color: Colors.blue,
                      ),
                      onTap: () async {

                        await _callAddEmployeeAPI();
                        nameController.clear();
                        jobController.clear();
                         print("inside add-emp-details${response.toString()}");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeesDetailsScreen(response: response,)));
                      },),
                  ],
                ),
              ),
            ),

          );

        }
        ),

      );



  }
}
