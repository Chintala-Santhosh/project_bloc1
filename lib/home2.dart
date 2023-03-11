import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc1/blocsfolder/home_bloc.dart';
import 'package:project_bloc1/model/update_user_request_model.dart';
import 'package:project_bloc1/model/user_modal.dart';
import 'package:project_bloc1/screens/add_employee_screen.dart';

import 'base_state.dart';
import 'home/home_events.dart';
import 'model/updare_user_response_model.dart';

class Home2 extends StatefulWidget {
  Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final HomeBloc _bloc =  HomeBloc(initialState: Loading());
  List<UserModel2> userlist=[];


  @override
  void initState() {

    _bloc.add(GetUserDetails());

    super.initState();
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
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddEmployeeScreen()));
              },
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => _bloc,
      child: BlocBuilder<HomeBloc,BaseState>(builder: (context,state){
          if( state is Loading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is DataLoaded){
            if(state.event=="GetUserDetails"){
            userlist=state.data;
            print(userlist);}


          }
          if(state is Error) {
            return Center(child: Text('error'),);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child:  FutureBuilder<UserModel2>(
                  future:null,
                  builder: ((context,data){
                    return ListView.builder(
                      shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: userlist.length,
                        itemBuilder: (_,index){
                          return Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                    title: Text(userlist[index].first_name),

                                    subtitle: Text(userlist[index].last_name),
                                    trailing: CircleAvatar(
                                      backgroundImage: NetworkImage(userlist[index].avatar),)
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  }
                  ))
              ),

            ],
          );
          return Container();

        }
        ),

      ),
    );



  }

}

