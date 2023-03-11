import 'package:flutter/material.dart';
import 'package:project_bloc1/screens/home_screen.dart';


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
    return  const HomeScreen();


  }

}




