import 'package:app_chat/screens/chat/profil.dart';
import 'package:flutter/material.dart';
import 'package:app_chat/providers/conversation_provider.dart';
import 'package:app_chat/screens/welcome/welcome_screen.dart';

import 'package:app_chat/constants.dart';
import 'package:provider/provider.dart';
import 'component/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key});
  static const String routeName = 'chat';

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 0; // Initialize with the first item selected

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ConversationProvider>(context, listen: false)
          .getConversations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.person_add_alt_1),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        if (value == 2) {
          // Handle disconnect button tap
          disconnectAndNavigateToWelcomeScreen();
        } else {
          setState(() {
            _selectedIndex = value;
          });
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/logo2.png"),
            ),
          ),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app), // You can change the icon as needed
          label: "Disconnect",
        ),
      ],
    );
  }

  // Function to handle disconnection and navigation to WelcomeScreen
  void disconnectAndNavigateToWelcomeScreen() {
    // Implement your disconnection logic here (e.g., log out)

    // Navigate to WelcomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: Text("Chats"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
