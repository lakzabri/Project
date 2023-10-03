import 'package:app_chat/screens/chat/chats_screen.dart';
import 'package:app_chat/screens/signup_siginn/inscription.dart';
import 'package:app_chat/screens/signup_siginn/signin_signup_screen.dart';
import 'package:app_chat/screens/welcome/dashbord.dart';
import 'package:app_chat/screens/welcome/doctor.dart';
import 'package:app_chat/screens/welcome/rendez_vous.dart';
import 'package:app_chat/screens/welcome/welcome_screen.dart';

import 'package:flutter/material.dart';

const String initialRoute = "main";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'chat':
        return MaterialPageRoute(builder: (_) => ChatsScreen());

      case 'main':
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case 'login':
        return MaterialPageRoute(builder: (_) => SigninOrSignUpScreen());
      case 'sign-up':
        return MaterialPageRoute(builder: (_) => Inscription());
      case 'doctor':
        return MaterialPageRoute(builder: (_) => Doctor());
      case 'dashbord':
        return MaterialPageRoute(builder: (_) => AdminDashboard());
      case 'rendez-vous':
        return MaterialPageRoute(builder: (_) => RendezVous());
      case 'conversation':
        return MaterialPageRoute(builder: (_) => ChatsScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("Non route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
