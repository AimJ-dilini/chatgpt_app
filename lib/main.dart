import 'package:chatgpt_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatGPTApp());
}

class ChatGPTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChatScreen(), //
    );
  }
}
