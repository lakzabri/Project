import 'package:app_chat/constants.dart';

import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: KDefualtPadding, vertical: KDefualtPadding / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Color(0xFF087949).withOpacity(0.8))
        ],
      ),
      child: SafeArea(
          child: Row(
        children: [
          Icon(Icons.mic, color: kPrimaryColor),
          SizedBox(
            width: KDefualtPadding * 2,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: KDefualtPadding * 0.75),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.04),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.sentiment_satisfied_alt_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.color
                      ?.withOpacity(0.64),
                ),
                SizedBox(
                  width: KDefualtPadding / 4,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "Type message", border: InputBorder.none),
                )),
                Icon(
                  Icons.attach_file,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.color
                      ?.withOpacity(0.64),
                ),
                SizedBox(
                  width: KDefualtPadding / 4,
                ),
                Icon(
                  Icons.camera_alt_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.color
                      ?.withOpacity(0.64),
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }
}
