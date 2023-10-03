import 'package:app_chat/constants.dart';
import 'package:app_chat/models/chat_message.dart';
import 'package:app_chat/screens/chat/component/text_message.dart';
import 'package:app_chat/screens/messages/components/Video_message.dart';
import 'package:app_chat/screens/messages/components/audio_message.dart';

import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.message,
  });
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage messageType) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);

        case ChatMessageType.audio:
          return AudioMessage(
            message: message,
          );

        case ChatMessageType.video:
          return VideoMessage();

        default:
          return SizedBox();
      }
    }

    return Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/logo1.png"),
            ),
            SizedBox(
              width: KDefualtPadding / 2,
            )
          ],
          messageContaint(message),
          if (message.isSender)
            MessageSatatusDot(
              status: message.messageStatus,
            )
        ]);
  }
}

class MessageSatatusDot extends StatelessWidget {
  final MessageStatus status;
  const MessageSatatusDot({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.notSent:
          return kErrorColor;
        case MessageStatus.notViewed:
          final bodySmallColor = Theme.of(context).textTheme.bodySmall?.color;
          return bodySmallColor?.withOpacity(0.1) ?? Colors.transparent;
        case MessageStatus.viewed:
          return kPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: KDefualtPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.notSent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
