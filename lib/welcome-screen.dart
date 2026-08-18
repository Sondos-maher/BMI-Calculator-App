import 'package:flutter/material.dart';
import 'calculationscreen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/Illustration.png"),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 45,
            ),
            height: 400,
            decoration: BoxDecoration(
              color: const Color(0xff7876CD),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const Text(
                  "Know Your Body Better, Get Your BMI Score in Less Than a Minute!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "It takes just 30 seconds – and your health is worth it!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF8F9FFE5),
                  ),
                ),

                const SizedBox(height: 24),

                const Divider(),

                const SizedBox(height: 24),

                SizedBox(
                  width: 390,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      backgroundColor: const Color(0xff484783),
                    ),
                    onPressed: () {
                      onGetStarted(context);
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onGetStarted(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalculationScreen(),
      ),
    );
  }
}