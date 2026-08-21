import 'package:flutter/material.dart';

class calculationscreen extends StatefulWidget {
  const calculationscreen({super.key});

  @override
  State<calculationscreen> createState() => _calculationscreenState();
}

class _calculationscreenState extends State<calculationscreen> {
  final GlobalKey<FormState> check =GlobalKey<FormState>();
  TextEditingController _TextName =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text("BMI", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40,color: Color(0xff01502EE5),letterSpacing:5),)),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: check,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Name",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
              TextFormField(
                maxLength: 50,
                controller: _TextName,
                decoration:InputDecoration(
                  counterText: "",
                  fillColor: Color(0x26B3B2EA),
                  filled: true,
                  hintText: "ex.Sondos Maher",
                  enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                  )

                ) ,
                validator:(value) {
                  if(_TextName.text.isEmpty){
                    return "This is required";
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),
              Text("Name",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
              TextFormField(
                maxLength: 50,
                controller: _TextName,
                decoration:InputDecoration(
                    counterText: "",
                    fillColor: Color(0x26B3B2EA),
                    filled: true,
                    hintText: "ex.Sondos Maher",
                    enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )

                ) ,
                validator:(value) {
                  if(_TextName.text.isEmpty){
                    return "This is required";
                  }
                  return null;
                },

              ),
              SizedBox(height: 20,),

            ],),

        ),
      ),
    );

  }
}


