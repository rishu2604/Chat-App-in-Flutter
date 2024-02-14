import 'dart:developer';

import 'package:chat_app/Extensions/build_context_extensions.dart';
import 'package:chat_app/Screens/chat_screen.dart';
import 'package:chat_app/Screens/registration_screen.dart';
import 'package:chat_app/Styles/constants.dart';
import 'package:chat_app/Widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login', style: titleTextStyle),
          CustomTextField(
              controller: emailController,
              hintText: 'Email',
              isPassword: false,
              icon: Icons.email),
          CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              isPassword: true,
              icon: Icons.lock),
          ElevatedButton(onPressed: (){
            loginUser();
          }, child: const Text("Login")),
          GestureDetector(
            onTap: () {
              context.navigateToScreen(RegistrationScreen());
            },
            child: const Text('New User? Create a new account'),
          ),
        ],
      ),
    );
  }

  Future<void> loginUser() async{
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      context.navigateToScreen(const ChatScreen(), isReplace: true);
    });
  }
}
