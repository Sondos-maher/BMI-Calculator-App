import 'package:flutter/material.dart';
class welcomepage extends StatelessWidget {
  const welcomepage({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar() ,
      body:Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(color: Color(0xff7876CD), borderRadius: BorderRadius.circular(25) ),
            child: Column(children: [
              Text("Know Your Body Better ,Get Your BMI Score in Less Than a Minute!" ,style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: Colors.white),),
              SizedBox(height: 10,),
              Text("Know Your Body Better ,Get Your BMI Score in Less Than a Minute!It takes just 30 seconds – and your health is worth it ,Get Start" ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),),
              SizedBox(height: 20,),
              Divider(),

              SizedBox(

                  child:
                  ElevatedButton(onPressed: (){}, child: Text("Get Started" ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.white),))),
            ], ),

          ) ,





        ],) ,
      
    );
  }
}