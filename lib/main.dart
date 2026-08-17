import 'package:bmi_aug/welcome-screen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({ super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "calculta app",
    home:  const welcomepage() , );
  }
}



