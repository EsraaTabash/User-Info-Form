import 'package:flutter/material.dart';
import 'package:training_app_5/PageNotFound.dart';
import 'UserForm.dart';
import 'UserInfo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/UserForm',
        routes: {
          '/UserForm':(context) => UserForm(),
          '/UserInfo':(context) => UserInfo(),
          '/PageNotFound':(context) => PageNotFound(),
        },
    onGenerateRoute: (RouteSettings settings){
           return MaterialPageRoute(builder: (context){
            return PageNotFound();
          });
    },
    );
  }
}
