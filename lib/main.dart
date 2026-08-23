import 'package:bmi_aug/welcome-screen.dart';
import 'package:dio/dio.dart' show Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  var apiobject = Dio();
  var link = "https://jsonplaceholder.typicode.com/users";
  var res = await apiobject.get(link);
  print(res);
  print("################################# create user");
  var body = {
    "name": "Sondos Maher",
    "username": "SM",
    "email": "Sondos@nti.com"
  };
  var link2 = "https://jsonplaceholder.typicode.com/users";
  var res2 = await apiobject.post(link2, data: body);
  print(res2);
}


























   //class MyApp extends StatelessWidget {
     //const MyApp({super.key});

     //@override
    // Widget build(BuildContext context) {
       //return  const MaterialApp( title: "BMI calculation",
       //home: WelcomePage(),);
    // }
   //}


