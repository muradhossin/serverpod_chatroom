import 'package:chatroom_flutter/src/utils/serverpod_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<auth.UserInfo>? _users;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getChatList();
  }

  void _getChatList() async {
    try {
      _users = await serverpodClientInitializer.client.chatMessage
          .getChatListByUserId(
        serverpodClientInitializer.sessionManager.signedInUser!.id!,
      );
      setState(() {});
    } catch (e) {
      print('Failed to get chat list: $e');
      setState(() {
        _users = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _getChatList();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chatroom'),
          actions: [
            IconButton(
              icon: const Icon(Icons.person, size: 30),
              onPressed: () {
                Get.toNamed('/account');
              },
            )
          ],
        ),
        body: _users != null
            ? _users!.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _users!
                        .length, // Replace with the actual number of chat items
                    itemBuilder: (context, index) {
                      final user = _users![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          tileColor: Colors.indigo[50],
                          leading: Icon(Icons.chat),
                          title: Text(user.userName ?? user.email!),
                          onTap: () {
                            Get.toNamed('/chat',
                                arguments:
                                    user.email); // Navigate to chat screen
                          },
                        ),
                      );
                    },
                  )
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Start chatting by adding a user'),
                          ],
                        ),
                      ),
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                final TextEditingController emailController =
                    TextEditingController();
                return AlertDialog(
                  title: const Text('Start chat using email'),
                  content: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final email = emailController.text.trim();
                        if (email.isNotEmpty) {
                          // Handle the email input
                          print('Email entered: $email');
                          final user = await serverpodClientInitializer
                              .client.chatMessage
                              .findUserByEmail(email);
                          if (user != null &&
                              user.email !=
                                  serverpodClientInitializer
                                      .sessionManager.signedInUser!.email) {
                            Navigator.of(context).pop();
                            Get.toNamed('/chat', arguments: email);
                          } else {
                            Get.snackbar('Error', 'User not found',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                margin: const EdgeInsets.all(10));
                          }
                        } else {
                          Get.snackbar('Error', 'Please enter an email',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              margin: const EdgeInsets.all(10));
                        }
                      },
                      child: const Text('add'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
