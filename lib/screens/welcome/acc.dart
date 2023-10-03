import 'package:app_chat/components/primary_button.dart';
import 'package:app_chat/screens/signup_siginn/signin_signup_screen.dart';

import 'package:app_chat/screens/welcome/doctor.dart';
import 'package:flutter/material.dart';

class ACC extends StatelessWidget {
  const ACC({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Transform.scale(
                  scale: 0.7, // Adjust the scale factor as needed
                  child: Image.asset("assets/icons/dent.png"),
                ),
              ),

              SizedBox(
                  height:
                      20), // Add some spacing between the image and buttons.
              PrimaryButton(
                text: "Patient",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SigninOrSignUpScreen(),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add spacing between buttons.
              PrimaryButton(
                text: "Doctor",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Doctor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
