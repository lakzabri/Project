import 'package:http/http.dart' as http;

class BaseApi {
  Future<http.Response> httpGet(String path) async {
    final url = Uri.parse('https://example.com/$path');
    final response = await http.get(url);
    return response;
  }
}

class ConversationsService extends BaseApi {
  Future<http.Response> getConversations() async {
    return await httpGet('Conversation');
  }
}

void main() async {
  final conversationService = ConversationsService();
  final response = await conversationService.getConversations();

  if (response.statusCode == 200) {
    print('Response: ${response.body}');
  } else {
    print('Error: ${response.statusCode}');
  }
}
