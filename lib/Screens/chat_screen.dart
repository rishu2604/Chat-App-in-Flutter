import 'package:chat_app/Extensions/build_context_extensions.dart';
import 'package:chat_app/Screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat Room'),
        elevation: 5,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  context.navigateToScreen(LoginScreen(), isReplace: true);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(children: [
        const Spacer(),
        Container(
            width: double.infinity,
            height: 100,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: context.getWidth(percentage: 0.80),
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        hintText: 'write your message',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        sendMessage();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ))
                ],
              ),
            )),
      ]),
    );
  }

  Future<void> sendMessage() async {
    if (messageController.text.isNotEmpty) {
      final message = {
        'message': messageController.text,
        'senderUid': FirebaseAuth.instance.currentUser!.uid,
        'senderEmail': FirebaseAuth.instance.currentUser!.email,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };

      FirebaseFirestore.instance
          .collection('messages')
          .add(message)
          .then((value) {
        messageController.clear();
      });
    }
  }
}
