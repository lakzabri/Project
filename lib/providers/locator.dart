import 'package:app_chat/providers/auth_provider.dart';
import 'package:app_chat/providers/conversation_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance; // Use 'instance' instead of '_instance'

void setupLocator() {
  locator.registerLazySingleton(() => ConversationProvider());
  locator.registerFactory(() => AuthProvider());
}
