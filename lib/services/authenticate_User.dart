import 'dart:convert';

import 'package:app_chat/constants.dart';
import 'package:app_chat/services/auth_services.dart';

void main() {
  final authService = AuthService(baseUrl: Url);

  authenticateUser(authService);
}

Future<void> authenticateUser(AuthService authService) async {
  final response = await authService.getUser();

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final bool isAdmin = responseData[
        'isAdmin']; // Assuming the response includes an 'isAdmin' field

    if (isAdmin) {
      print('User is authenticated as an admin.');
    } else {
      print('User is authenticated but is not an admin.');
    }
  } else {
    print('User authentication failed.');
  }
}
