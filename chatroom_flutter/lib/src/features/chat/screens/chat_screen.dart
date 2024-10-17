import 'dart:async';
import 'package:chatroom_client/chatroom_client.dart';
import 'package:chatroom_flutter/src/features/chat/widgets/typing_indicator_widget';
import 'package:chatroom_flutter/src/utils/serverpod_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;

class ChatScreen extends StatefulWidget {
  final String receiverEmail;
  ChatScreen({Key? key, required this.receiverEmail}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late Client _client;
  final List<ChatMessage> _messages = [];
  Timer? _typingTimer;
  bool _isTyping = false;
  auth.UserInfo? receiverInfo;

  @override
  void initState() {
    super.initState();
    _client = serverpodClientInitializer.client;
    _initalize();
  }

  void _initalize() async {
    await _findReceiverInfo();
    await _connectToServer(); // Establish WebSocket connection
    await _getAllMessages();
  }

  Future<void> _findReceiverInfo() async {
    // Find the receiver's info
    try {
      receiverInfo =
          await _client.chatMessage.findUserByEmail(widget.receiverEmail);
      setState(() {});
    } catch (e) {
      print('Failed to get receiver info: $e');
    }
  }

  void _onMessageChanged(String message) {
    print('Message: $message');
    if (message.isNotEmpty) {
      _sendTypingNotification();
    }
  }

  void _sendTypingNotification() {
    _client.chatMessage.handleTypingNotification(
        serverpodClientInitializer.sessionManager.signedInUser!.id!,
        receiverInfo?.id ?? 0,
        true);

    _typingTimer?.cancel();
    _typingTimer = Timer(Duration(seconds: 2), () {
      _client.chatMessage.handleTypingNotification(
          serverpodClientInitializer.sessionManager.signedInUser!.id!,
          receiverInfo?.id ?? 0,
          false);
    });
  }

  Future<void> _getAllMessages() async {
    print('receiverInfo?.id: ${receiverInfo?.userName}');
    try {
      final messages = await _client.chatMessage.getMessages(
        serverpodClientInitializer.sessionManager.signedInUser!.id!,
        receiverInfo?.id ?? 0,
      );
      setState(() {
        _messages.addAll(messages);
      });
    } catch (e) {
      print('Failed to get messages: $e');
    }
  }

  Future<void> _connectToServer() async {
    try {
      await _client.openStreamingConnection();
      print('Connected to server');

      _client.chatMessage.resetStream();

      // Listen for incoming messages from the server
      _client.chatMessage.stream.listen(
        (message) {
          print('Received message: $message');
          if ((message as ChatMessage).messageType == 'typing') {
            _showTypingIndicator((message as ChatMessage));
            return;
          } else {
            setState(() {
              if ((message as ChatMessage).messageType != 'typing') {
                _typingTimer?.cancel();
                _isTyping = false;
                _messages.add(message as ChatMessage);
              }
            });
          }
        },
        onError: (error) {
          print('Error in stream: $error');
        },
      );
    } catch (e) {
      print('Failed to connect to server: $e');
    }
  }

  void _showTypingIndicator(ChatMessage chatMessage) {
    setState(() {
      if (chatMessage.isTyping)
        _isTyping = true;
      else
        _isTyping = false;
    });

    // Future.delayed(Duration(seconds: 3), () {
    //   setState(() {
    //     _isTyping = false;
    //   });
    // });
  }

  Future<void> _sendMessage() async {
    if (_messageController.text.isEmpty) return;

    final chatMessage = ChatMessage(
      senderId: serverpodClientInitializer.sessionManager.signedInUser!.id!,
      receiverId: receiverInfo?.id ?? 0,
      message: _messageController.text,
      messageType: 'text',
      timestamp: DateTime.now(),
      isDelivered: false,
      isSeen: false,
      isActive: true,
      isTyping: false,
    );

    // Send the message to the server's endpoint
    try {
      await _client.chatMessage.sendStreamMessage(chatMessage);
      print('Message sent: $chatMessage');

      setState(() {
        _messages.add(chatMessage);
      });

      _messageController.clear();
    } catch (e) {
      print('Failed to send message: $e');
    }
  }

  @override
  void dispose() {
    // Cancel the stream subscription when the widget is disposed
    _client.closeStreamingConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return receiverInfo != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(receiverInfo?.userName ?? 'Chat'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[_messages.length - 1 - index];
                      final isMe = message.senderId ==
                          serverpodClientInitializer
                              .sessionManager.signedInUser!.id!;
                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blueAccent : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.message,
                                style: TextStyle(
                                  color: isMe ? Colors.white : Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                DateFormat('hh:mm a')
                                    .format(message.timestamp.toLocal()),
                                style: TextStyle(
                                  color: isMe ? Colors.white70 : Colors.black54,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (_isTyping) TypingIndicatorWidget(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          onSubmitted: (value) => _sendMessage(),
                          onChanged: _onMessageChanged,
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blueAccent,
                        child: IconButton(
                          icon: Icon(Icons.send, color: Colors.white),
                          onPressed: _sendMessage,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
