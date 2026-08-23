import 'package:bmi_aug/moels/bmi_model.dart';
import 'package:flutter/material.dart';

class BmiDetails extends StatelessWidget {
  final  BmiResponse bmiModel;

  const BmiDetails({
    super.key,
    required this.bmiModel,

  });

  int calculateAge() {
    DateTime birth = DateTime.parse((bmiModel.birthDate??DateTime.now().toString()));
    DateTime today = DateTime.now();
    int age = today.year - birth.year;

    if (today.month < birth.month ||
        (today.month == birth.month && today.day < birth.day)) {
      age--;
    }

    return age;
  }

  String getBmiCategory() {
    double bmi = bmiModel.data?.bmi ?? 0.0;
    if (bmi < 18.5) {
      return 'Under Weight';
    } else if (bmi < 25) {
      return 'Normal Weight';
    } else if (bmi < 30) {
      return 'Over Weight';
    } else {
      return 'Obesity';
    }
  }

  String getBmiDescription() {
    double bmi = bmiModel.data?.bmi ?? 0.0;
    if (bmi < 18.5) {
      return 'Your BMI is less than 18.5';
    } else if (bmi < 25) {
      return 'Your BMI is in the normal range';
    } else if (bmi < 30) {
      return 'Your BMI is in the overweight range';
    } else {
      return 'Your BMI is in the obesity range';
    }
  }

  @override
  Widget build(BuildContext context) {
    int age = calculateAge();
    String name = bmiModel.name ?? 'Unknown';
    String gender = bmiModel.gender ?? 'Unknown';
    double bmi = bmiModel.data?.bmi ?? 0.0;
    String height = bmiModel.data?.height ?? '0';
    String weight = bmiModel.data?.weight ?? '0';

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              width: 400,
              height: 298,
              decoration: BoxDecoration(
                color: Color(0xff7876CD),
                borderRadius: BorderRadiusGeometry.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'A $age years old $gender .',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "$bmi",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "BMI calc",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '$height cm',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Height',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 50,
                                  width: 2,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    Text(
                                      "$weight kg",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Weight',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    height: 280,
                    width: 70,
                    child: Image.asset(
                      'assets/body.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: 400,
              height: 350,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff01502E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getBmiCategory(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    getBmiDescription(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. '
                        'Sagittis interdum dui enim imperdiet sapien cursus velit '
                        'pharetra. Viverra justo tempor dictum odio. Nisl non dui '
                        'integer orci nulla eget laoreet tellus. Orci nunc a orci '
                        'convallis ac orci. Urna auctor at elementum sit ante '
                        'maecenas ullamcorper rhoncus. Morbi venenatis lectus '
                        'ultrices euismod. Laoreet purus risus amet enim sagittis ut. '
                        'Consectetur libero orci urna.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: 400,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF484783)),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('calculate BMI again',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.white),)),
            )

          ],
        ),
      ),
    );
  }
}