import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc1/home/home_events.dart';
import 'package:project_bloc1/model/updare_user_response_model.dart';
import 'package:project_bloc1/model/update_user_request_model.dart';

import '../base_state.dart';
import '../blocsfolder/home_bloc.dart';


class UpdateUserDetailsScreen extends StatefulWidget {
  const UpdateUserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UpdateUserDetailsScreen> createState() => _UpdateUserDetailsScreenState();
}

class _UpdateUserDetailsScreenState extends State<UpdateUserDetailsScreen> {
  final HomeBloc _bloc = HomeBloc(initialState: Loading());
   List<UpdateUserResponse> response=[];
  TextEditingController nameController=TextEditingController();
  TextEditingController jobController=TextEditingController();


   @override
   void initState() {
     UpdateUserRequest request=UpdateUserRequest();
     request.name=nameController.text;
     request.job=jobController.text;
     _bloc.add(UpdateUserDetails(request: request));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        resizeToAvoidBottomInset: true,
        // resizeToAvoidBottomPadding: true,
        body: BlocProvider(
          create: (_) => _bloc,
          child: buildPage(),
        ),
      ),
    );
  }
   Widget buildPage() {
     return BlocListener<HomeBloc, BaseState>(listener: (context, state) async {
       if(state is Loading) {
          Center(child: Text('error'),);
       }else if(state is DataLoaded){
         if(state.event=="UpdateUserDetails"){
            response=state.data;
           print("${response.toString()}");
         }
       }

     },
       child: Container(
         height: 25,
         child: Text("${response}"),
       ),
     );
   }
}

