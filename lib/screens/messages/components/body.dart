import 'package:app_chat/constants.dart';
import 'package:app_chat/models/chat_message.dart';
import 'package:app_chat/screens/chat/component/messages.dart';
import 'package:app_chat/screens/messages/components/chat_input_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_chat/providers/conversation_provider.dart'; // Import your provider class

class BodyM extends StatelessWidget {
  const BodyM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: KDefualtPadding),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: KDefualtPadding),
              child: Consumer<ConversationProvider>(
                builder: (context, provider, child) {
                  if (provider.busy) {
                    return CircularProgressIndicator();
                  } else {
                    // Replace 'demeChatMessage' with your actual chat messages list
                    return ListView.builder(
                      itemCount: demeChatMessage.length,
                      itemBuilder: (context, index) => Message(
                        message: demeChatMessage[index],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          ChatInputField()
        ],
      ),
    );
  }
}
