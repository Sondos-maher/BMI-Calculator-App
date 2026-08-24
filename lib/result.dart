import 'package:flutter/material.dart';
import 'models/bmi_model.dart';

class BmiDetails extends StatelessWidget {
  final BmiResponse bmiModel;

  const BmiDetails({
    super.key,
    required this.bmiModel,
  });

  int calculateAge() {
    DateTime birth =
    DateTime.parse(bmiModel.birthDate ?? DateTime.now().toString());

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
      appBar: AppBar(
        title: const Text("BMI Result"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Text(
              name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "$age years old $gender",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "$bmi",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "BMI",
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "Height: $height",
              style: const TextStyle(fontSize: 20),
            ),

            Text(
              "Weight: $weight",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            Text(
              getBmiCategory(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              getBmiDescription(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Calculate BMI Again"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
