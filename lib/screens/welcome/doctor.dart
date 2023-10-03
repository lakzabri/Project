import 'package:app_chat/screens/welcome/dashbord.dart';
import 'package:flutter/material.dart';

import 'package:app_chat/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool isObscure = true; // Whether the password is obscured or not

  // Email validation function
  bool validateEmail(String value) {
    if (value.isEmpty) {
      emailFocusNode.requestFocus();
      return false;
    } else {
      // You can use a regular expression to validate the email format
      // For simplicity, this example only checks if '@' is present
      if (!value.contains('@')) {
        emailFocusNode.requestFocus();
        return false;
      }
    }
    return true;
  }

  // Password validation function
  bool validatePassword(String value) {
    if (value.isEmpty) {
      passwordFocusNode.requestFocus();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/dentiste.png", height: 160),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordController,
                focusNode: passwordFocusNode,
                obscureText: isObscure,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: isObscure
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  var login =
                      await Provider.of<AuthProvider>(context, listen: false)
                          .login(emailController.text, passwordController.text);

                  if (login) {
                    final authProvider =
                        Provider.of<AuthProvider>(context, listen: false);

                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    if (prefs.getString("role") == "admin") {
                      // User is an admin, perform actions or navigate to admin dashboard
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminDashboard()),
                      );
                    } else {
                      // User is not an admin, display an error message or take other actions
                      print('User is not an admin');
                    }
                  } else {
                    // Handle login failure here, e.g., display an error message
                    print('Login failed');
                  }
                },
                child: Text("Sign In as Admin"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
