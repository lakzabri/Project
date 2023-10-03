import 'dart:convert';

import 'package:app_chat/models/chat.dart';
import 'package:app_chat/providers/base_provider.dart';

import 'package:app_chat/services/conversation_services.dart';

class ConversationProvider extends BaseProvider {
  ConversationsService _conversationsService = ConversationsService();

  List<Chat> get conversations => conversations;

  Future<List<Chat>> getConversations() async {
    setBusy(true);
    var response = await _conversationsService.getConversations();
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data['data'].forEach(
          (Conversation) => conversations.add(Chat.fromJson(Conversation)));
      print(response.body);
      notifyListeners();
      setBusy(false);
    }
    return conversations;
  }
}
