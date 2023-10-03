import 'package:app_chat/providers/auth_provider.dart';
import 'package:app_chat/providers/conversation_provider.dart';
import 'package:app_chat/providers/locator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ConversationProvider>(
    create: (context) => locator<ConversationProvider>(),
  ),
  ChangeNotifierProvider<AuthProvider>(
    create: (context) => locator<AuthProvider>(),
  ),
];
