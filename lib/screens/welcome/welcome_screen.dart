import 'package:app_chat/constants.dart';
import 'package:app_chat/main_screen.dart';
import 'package:app_chat/providers/auth_provider.dart';
import 'package:app_chat/screens/welcome/acc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});
  static const String routeName = 'welcome';
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var userExist =
          await Provider.of<AuthProvider>(context, listen: false).getUser();
      if (userExist) {
        Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Provider.of<AuthProvider>(context).busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Center(
                    child: Transform.scale(
                      scale: 0.8, // Adjust the scale factor as needed
                      child: Image.asset("assets/images/logo1.png"),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "Welcome to ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "Dm me",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                        TextSpan(
                          text: " app",
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: Text(
                      "In order to follow up on your condition and schedule an appointment",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.color
                                  ?.withOpacity(0.8)),
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FittedBox(
                    child: TextButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ACC())),
                      child: Row(
                        children: [
                          Text("Skip",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.color
                                          ?.withOpacity(0.8))),
                          SizedBox(
                            width: KDefualtPadding / 4,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.color
                                ?.withOpacity(0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: "powered by: ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.color
                                  ?.withOpacity(0.7)),
                      children: [
                        TextSpan(
                          text: "DM ME App",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
