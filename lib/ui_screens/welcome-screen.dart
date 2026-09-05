import 'package:flutter/material.dart';
import 'calculationscreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/Illustration.png"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration:BoxDecoration(color: Color(0xff7876CD),borderRadius: BorderRadius.circular(25),) ,

            child: Column(

              children: [
                Text("Know Your Body Better ,Get Your BMI Score in Less Than a Minute!",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xffFFFFFF)),),
                SizedBox(height: 40,),

                Text("It takes just 30 seconds – and your health is worth it!It takes just 30 seconds – and your health is worth it!",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: Color(0xffFFFFFF),),),
               SizedBox(height: 40,),
                 const Divider(color: Color(0xffF8F9FFA6),),
                SizedBox(height: 40,),

                SizedBox(
                  width: 420,

                    child:  ElevatedButton(onPressed:(){OnGetstarted(context);},
                      child: Text("Get Started",
                        style:TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.w600),),
                      style:ElevatedButton.styleFrom(backgroundColor: Color(0xff484783),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))),)
                ),
                SizedBox(height: 15,),



              ],

            ),

          ),
        ],
      ),
    );

  }

}
void OnGetstarted( BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => calculationscreen()));
}
