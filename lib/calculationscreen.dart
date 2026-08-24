import 'package:bmi_aug/result.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' show Dio, Options;

import 'models/bmi_model.dart';


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
      title: Text(
      "BMI",
      style: TextStyle(
        letterSpacing: 20,
        fontWeight: FontWeight.w900,
        fontSize: 26,
        color: const Color(0xE501502E),
      ),
    ),
    ),
      body:
      Padding(

        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
        Form(
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
                    hintText: "22/10/2005",
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
              Text(
                "select gender",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedgender = 0;
                      setState(() {});
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0x26B3B2EA),
                        border: selectedgender == 0
                            ? Border.all(width: 1, color: Color(0xE501502E))
                            : null,
                      ),
                      child: Image.asset("assets/Group.png"),
                    ),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      selectedgender = 1;
                      setState(() {});
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0x26B3B2EA),
                        border: selectedgender == 1
                            ? Border.all(width: 1, color: Color(0xE501502E))
                            : null,
                      ),
                      child: Image.asset("assets/female.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                "Your Height(cm)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                textAlign: TextAlign.center,
                controller:_hightController ,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      var x = int.parse(_hightController.text);
                      x++;
                      _hightController.text = x.toString();
                    },
                    child: Icon(Icons.add, size: 26, color: Colors.black),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      var x = int.parse(_hightController.text);
                      if (x > 0) {
                        x--;
                      }
                      _hightController.text = x.toString();
                    },
                    child: Icon(Icons.remove, size: 26, color: Colors.black),
                  ),
                  counterText: "",
                  fillColor: Color(0x26B3B2EA),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLength: 50,

              ),


              SizedBox(height: 24),


              Text(
                "Your Weight(kg)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                textAlign: TextAlign.center,
                controller: _weightcontroller,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      var x = int.parse(_weightcontroller.text);
                      x++;
                      _weightcontroller.text = x.toString();
                    },
                    child: Icon(Icons.add, size: 26, color: Colors.black),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      var x = int.parse(_weightcontroller.text);
                      if (x > 0) {
                        x--;
                      }
                      _weightcontroller.text = x.toString();
                    },
                    child: Icon(Icons.remove, size: 26, color: Colors.black),
                  ),
                  counterText: "",
                  fillColor: Color(0x26B3B2EA),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLength: 50,

              ),


              Spacer(),
              SizedBox(height: 50 ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  backgroundColor: Color(0xff484783),
                  minimumSize: Size(double.infinity, 40),
                ),

                onPressed: () async {
                  if (check.currentState!.validate()) {
                    print(_TextName.text);
                    print(_birthDateController.text);
                    print(selectedgender);
                    print(_hightController.text);
                    print(_weightcontroller.text);


                    var dio = Dio();
                    var res = await dio.get(
                      "https://api.apiverve.com/v1/bmicalculator?weight=${_weightcontroller.text}&height=${_hightController.text}&unit=metric",
                      options: Options(
                          headers: {
                            "x-api-key":"apv_efe419ed-1da2-4df8-b229-a79e77401e08"

                          }
                      ),

                    );
                   if(res.data!=null){
                     var Data =res.data;
                     Data['name']=_TextName.text;
                     Data['birthDate']=_birthDateController.text;
                     Data['gender']=selectedgender==0?"male":"female";
                     var bmimodel = BmiResponse.fromJson(Data);
                     print(Data["status"]);
                     if (!mounted) return;
                     Navigator.push(context, MaterialPageRoute(builder: (context) => BmiDetails(bmiModel: bmimodel)));





                   }
                  }

                },

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
              SizedBox(height: 40,)



            ],),


        ),
      ),
    );

  }
}