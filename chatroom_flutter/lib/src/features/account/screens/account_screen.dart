import 'package:chatroom_flutter/src/utils/serverpod_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: ListView(
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: Icon(Icons.person, size: 40),
            title: Text(serverpodClientInitializer
                    .sessionManager.signedInUser!.userName ??
                ''),
            subtitle: Text(
                serverpodClientInitializer.sessionManager.signedInUser!.email ??
                    ''),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                serverpodClientInitializer.sessionManager.signOut();
                Get.offAllNamed('/signin');
              },
              child: const Text('Sign out'),
            ),
          ),
        ],
      ),
    );
  }
}
