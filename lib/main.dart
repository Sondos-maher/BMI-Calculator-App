import 'package:bmi_aug/welcome-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()  {
  runApp(MyApp());
}

   class MyApp extends StatelessWidget {
     const MyApp({super.key});

     @override
   Widget build(BuildContext context) {
       return  const MaterialApp( title: "BMI calculation",
       home: WelcomePage(),);
    }
   }


