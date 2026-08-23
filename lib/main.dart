import 'package:bmi_aug/welcome-screen.dart';
import 'package:dio/dio.dart' show Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() async {
  // runApp(MyApp());
  var apiobject = Dio();
  var link = "https://jsonplaceholder.typicode.com/users";
  var res = await apiobject.get(link);
  print(res);
  print("################################# create user");
  var body={

  };
  var link2 = "https://jsonplaceholder.typicode.com/users";
  var res2 = await apiobject.get(link2);


}




























   //class MyApp extends StatelessWidget {
     //const MyApp({super.key});

     //@override
    // Widget build(BuildContext context) {
       //return  const MaterialApp( title: "BMI calculation",
       //home: WelcomePage(),);
    // }
   //}


