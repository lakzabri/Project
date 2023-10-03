import 'package:app_chat/models/routes.dart';
import 'package:app_chat/providers/locator.dart';
import 'package:app_chat/providers/provider_setup.dart';
import 'package:app_chat/theme.dart';
import 'package:flutter/material.dart';
import 'package:app_chat/models/routes.dart' as AppChatRoutes;
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers, // Use the correct providers list
      child: StartApp(),
      // Correct the typo in the widget name
    );
  }
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.system,
      //home: WelcomeScreen(),
      initialRoute: initialRoute,
      onGenerateRoute: AppChatRoutes.Router
          .generateRoute, // Use the alias to specify the correct 'Router'
    );
  }
}
