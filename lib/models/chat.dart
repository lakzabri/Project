class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.time,
    required this.isActive,
  });
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      name: json['name'],
      lastMessage: json['lastMessage'],
      image: json['image'],
      time: json['time'],
      isActive: json['isActive'],
    );
  }
}

List chatsData = [
  Chat(
    name: "John Doe",
    lastMessage: "Hello",
    image: "assets/images/logo1.png",
    time: "10:30 AM",
    isActive: true,
  ),
  Chat(
    name: "Jane Smith",
    lastMessage: "Hi there!",
    image: "assets/images/logo1.png",
    time: "11:45 AM",
    isActive: false,
  ),
];
