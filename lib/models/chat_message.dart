enum ChatMessageType { text, audio, image, video }

enum MessageStatus { notSent, notViewed, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    required this.text,
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

List demeChatMessage = [
  ChatMessage(
      text: "hi bb",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false),
  ChatMessage(
      text: "hello bb",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: true),
  ChatMessage(
      text: "",
      messageType: ChatMessageType.audio,
      messageStatus: MessageStatus.viewed,
      isSender: false),
  ChatMessage(
      text: "",
      messageType: ChatMessageType.video,
      messageStatus: MessageStatus.viewed,
      isSender: true),
  ChatMessage(
      text: "error",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.notSent,
      isSender: true),
  ChatMessage(
      text: " bb",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.notViewed,
      isSender: false)
];
