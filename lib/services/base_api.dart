import 'package:http/http.dart' as http;

class BaseApi {
  final String baseUrl;

  BaseApi({required this.baseUrl});

  Future<http.Response> httpGet(String endPath,
      {Map<String, String>? query}) async {
    final fullUrl = Uri.parse('$baseUrl/$endPath');
    return await http.get(
      fullUrl,
      headers: {'accept': 'application/json'},
    );
  }
}
