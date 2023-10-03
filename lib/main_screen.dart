import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main_screen'; // Define a route name for navigation

  @override
  Widget build(BuildContext context) {
    // Your MainScreen widget code here
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Main Screen!'),
      ),
    );
  }
}
