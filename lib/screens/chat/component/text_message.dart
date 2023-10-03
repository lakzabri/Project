import 'package:app_chat/constants.dart';
import 'package:app_chat/models/chat_message.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    super.key,
    required this.message,
  });
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: KDefualtPadding * 0.75, vertical: KDefualtPadding / 2),
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isSender
                ? Colors.white
                : Theme.of(context).textTheme.bodySmall?.color,
          ),
        ));
  }
}
