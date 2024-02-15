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
      body: Stack(children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('messages').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Failed to fetch messages'),
              );
            } else if (snapshot.hasData) {
              final messages = snapshot.data!.docs;
              return Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 120,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(messages[index]['message']),
                        subtitle: Text(messages[index]['senderEmail']),
                      );
                    }),
              );
            } else {
              return const Center(
                child: Text('No messages'),
              );
            }
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
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
        ),
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

  void getMessages() {
    FirebaseFirestore.instance
        .collection('messages')
        .snapshots()
        .listen((event) {});
  }
}
