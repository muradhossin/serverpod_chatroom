import 'package:chatroom_flutter/src/utils/serverpod_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Dialog(
          child: Container(
            width: 260,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SignInWithEmailButton(
                  caller: serverpodClientInitializer.client.modules.auth,
                  onSignedIn: () => Get.offAllNamed('/home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
