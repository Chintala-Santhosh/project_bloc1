import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project_bloc1/repo/home_repository.dart';
import 'base_state.dart';
import 'blocsfolder/home_bloc.dart';
import 'home/home_events.dart';
import 'home2.dart';
import 'model/user_modal.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));}


// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<UserModel1?>.value(
//       value: AuthServices().user,
//       initialData: null,
//       catchError: (context, error) {
//
//       },
//       child: Wrapper(),
//     );
//
//
//   }
// }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context)=> HomeRepository(),
      child: Home2(),
    );


  }

}
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
                builder: ((context,snapshot){
                  if(snapshot.data != null){
                    print(snapshot.data);
                  }
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

        }
        ),
      ),
    );



  }
}




