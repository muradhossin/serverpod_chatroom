import 'package:chatroom_flutter/src/features/account/screens/account_screen.dart';
import 'package:chatroom_flutter/src/features/chat/screens/chat_screen.dart';
import 'package:chatroom_flutter/src/features/home/screens/home_screen.dart';
import 'package:chatroom_flutter/src/features/signin/screens/signin_screen.dart';
import 'package:chatroom_flutter/src/utils/serverpod_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await serverpodClientInitializer.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatroom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: serverpodClientInitializer.sessionManager.isSignedIn
          ? const HomeScreen()
          : const SigninScreen(),
      routes: {
        '/signin': (context) => SigninScreen(),
        '/home': (context) => HomeScreen(),
        '/account': (context) => AccountScreen(),
        '/chat': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return ChatScreen(receiverEmail: args);
        },
      },
    );
  }
}
