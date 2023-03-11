import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc1/home2.dart';
import 'package:project_bloc1/repo/home_repository.dart';
import 'package:project_bloc1/screens/add_employee_screen.dart';
import 'package:project_bloc1/screens/home_screen.dart';
import 'base_state.dart';
import 'blocsfolder/home_bloc.dart';
import 'home/home_events.dart';
import 'model/user_modal.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
      MaterialApp(
          home: MyApp(),
              debugShowCheckedModeBanner: false,
      )
  );
}



class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const AddEmployeeScreen();


  }

}




