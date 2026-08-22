import 'package:flutter/material.dart';

class calculationscreen extends StatefulWidget {
  const calculationscreen({super.key});

  @override
  State<calculationscreen> createState() => _calculationscreenState();
}

class _calculationscreenState extends State<calculationscreen> {
  final GlobalKey<FormState> check =GlobalKey<FormState>();
  TextEditingController _TextName =TextEditingController();
  TextEditingController _birthDateController =TextEditingController();
  TextEditingController _hightController =TextEditingController();
  TextEditingController _weightcontroller =TextEditingController();

  var selectedgender=0;
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text("BMI", style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40,color: Color(0xff01502EE5),letterSpacing:5),)),),

      body:
      Padding(

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
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)

                ) ,
                validator:(value) {
                  if(_TextName.text.isEmpty){
                    return "This is required";
                  }
                  return null;
                },

              ),
              SizedBox(height: 20),
              Text("Birth Date",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
              TextFormField(
                readOnly: true,
                maxLength: 50,
                controller: _birthDateController,
                onTap:()async {
                  var res= await showDatePicker(context: context, firstDate:  DateTime(1980), lastDate: DateTime.now());
                  print({"show"});
                  if(res!=null){
                    _birthDateController.text=res.toString();
                  }

                },

                decoration:InputDecoration(
                    counterText: "",
                    fillColor: Color(0x26B3B2EA),
                    filled: true,
                    hintText: "",
                    enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,

                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)
                ) ,
                validator:(value) {
                  if(value==null|| value.isEmpty){
                    return "This is required";
                  }
                  return null;
                },

              ),


              SizedBox(height: 20,),
              Text("Choose Gender",style: TextStyle(color: Colors.black,fontSize: 18),),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  GestureDetector(
                    onTap: () {
                      selectedgender=0;
                      setState(() {

                      });

                    },
                    child: Column(
                      children: [
                        Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0x26B3B2EA),
                              border: selectedgender == 0
                                  ? Border.all(
                                color: Color(0xff484783),
                                width: 3,
                              )
                                  : null,
                            ),

                            child:Column(children: [
                              Image.asset("assets/Group.png",),

                            ],)

                        ),
                        Text("male",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),)

                      ],
                    ),
                  ),
                  SizedBox(width: 40,),
                  GestureDetector(
                    onTap: () {
                      selectedgender=0;
                      setState(() {

                      });

                    },
                    child: Column(
                      children: [
                        Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0x26B3B2EA),
                              border: selectedgender == 1
                                  ? Border.all(
                                color: Color(0xff484783),
                                width: 3,
                              )
                                  : null,
                            ),

                            child:Column(children: [
                              Image.asset("assets/female.png",),

                            ],)

                        ),
                        Text("female",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),)

                      ],
                    ),
                  ),





                ],),
              SizedBox(height: 10,),
              Text(
                "Your Hight(CM)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight(500),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                readOnly: true,

                controller: _hightController,
                maxLength: 50,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this is reqiered";
                  }
                  return null;
                },

                decoration: InputDecoration(

                  suffixIcon: GestureDetector(onTap: (){
                    var x = int.parse(_hightController as String);
                    if(x>1){
                      counter--;

                    }
                  } ,child: Icon (Icons.add, size :26 ,color: Colors.black, )),
                  prefixIcon: GestureDetector(onTap: (){ counter++;},child: Icon (Icons.remove, size :26 ,color: Colors.black, ),),
                  fillColor: Color(0x26B3B2EA),
                  filled: true,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),SizedBox(height: 10,),
              Text(
                "Your weight(kg)",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight(500),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: _weightcontroller,
                maxLength: 50,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this is reqiered";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  suffixIcon: GestureDetector(onTap: (){
                    // var x = int.parse(_hightController)
                  } ,child: Icon (Icons.add, size :26 ,color: Colors.black, )),
                  prefixIcon: GestureDetector(onTap: (){},child: Icon (Icons.remove, size :26 ,color: Colors.black, ),),
                  fillColor: Color(0x26B3B2EA),
                  filled: true,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 50 ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  backgroundColor: Color(0xff484783),
                  minimumSize: Size(double.infinity, 40),
                ),

                onPressed: () {},

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Calculate BMI",
                      style: TextStyle(fontSize: 20, color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),


            ],),


        ),
      ),
    );

  }
}