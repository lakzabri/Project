import 'package:app_chat/components/filed_outline_button.dart';
import 'package:app_chat/constants.dart';
import 'package:app_chat/models/chat.dart';

import 'package:app_chat/screens/messages/message_screen.dart';
import 'package:app_chat/screens/welcome/rendez_vous.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              KDefualtPadding, 0, KDefualtPadding, KDefualtPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              SizedBox(width: KDefualtPadding * 3),
              FillOutlineButton(
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RendezVous(),
                  ),
                ),
                text: "Rendez-vous",
                isFilled: false,
              ),
              SizedBox(width: KDefualtPadding * 3),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              key: UniqueKey(), // Provide a unique key here
              chat: chatsData[index],
              press: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagesScreen())),
            ),
          ),
        )
      ],
    );
  }
}

class ChatCard extends StatelessWidget {
  final Key key;
  final dynamic chat;
  final VoidCallback press; // Replace 'dynamic' with the actual type of 'chat'

  const ChatCard({
    required this.key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: KDefualtPadding, vertical: KDefualtPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(chat.image),
                ),
                if (chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor))),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: KDefualtPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Opacity(opacity: 0.64, child: Text(chat.time))

            // Add more widgets to display chat information
          ],
        ),
      ),
    );
  }
}
