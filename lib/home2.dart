import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc1/blocsfolder/home_bloc.dart';
import 'package:project_bloc1/model/user_modal.dart';
import 'package:project_bloc1/repo/home_repository.dart';

import 'base_state.dart';
import 'home/home_events.dart';

class Home2 extends StatelessWidget {
  Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>HomeBloc(RepositoryProvider.of<HomeRepository>(context),
      )..add(GetHomePageDetail()),
    child: Scaffold(
      appBar: AppBar(
        title: Text("bloC"),
      ),
      body: BlocBuilder<HomeBloc,BaseState>(builder: (context,state){
        if( state is Loading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if( state is Loaded){
          List<UserModel2> userlist=state.users;
          print(userlist);
          return FutureBuilder<UserModel2>(
            future:null,
            builder: ((context,data){
              return ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (_,index){
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(userlist[index].last_name),

                          subtitle: Text(userlist[index].last_name),
                        ),
                      ],
                    ),
                  );
                }
              );
            }
          ));

        }
        if(state is Error) {
          return Center(child: Text('error'),);
        }
        return Container();
        return Container();

      }
      ),
    ),
    );



  }
}

