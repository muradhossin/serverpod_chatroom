import 'package:chatroom_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

class ChatMessageEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    print('Chat stream opened.');
    final authenticationInfo = await session.authenticated;
    final userId = authenticationInfo?.userId;

    if (userId == null) {
      print('User not authenticated.');
      session.close();
      return;
    }
    session.messages.addListener(
      '$userId',
      (message) async {
        print('Sending message to user $userId.');
        await sendStreamMessage(session, message);
      },
    );

    try {
      // Update user status to online in the database
      var userStatus = await session.db.findFirstRow<UserStatus>(
        where: UserStatus.t.userId.equals(userId),
      );

      if (userStatus != null) {
        print('UserStatus found in the database.');
        // Update the existing UserStatus
        userStatus.isOnline = true;
        userStatus.lastSeen = DateTime.now();

        // Update the user status in the database
        await session.db.updateRow(userStatus);
      } else {
        // If no existing UserStatus, create a new entry
        print('UserStatus not found in the database.');
        userStatus = UserStatus(
          userId: userId,
          isOnline: true,
          lastSeen: DateTime.now(),
        );

        // Insert the new UserStatus into the database
        await session.db.insertRow(userStatus);
      }
    } catch (e) {
      print('stream opened userstatus db: $e');
    }

    // Add the session to the manager
    streamingSessionManager.addSession(userId, session);

    print('User $userId connected to the chat stream.');
    return super.streamOpened(session);
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    print('Chat stream closed.');
    final userId = streamingSessionManager.getUserIdBySession(session);

    print('Chat stream closed User ID: $userId');

    if (userId != null) {
      try {
        // Update user status to online in the database
        var userStatus = await session.db.findFirstRow<UserStatus>(
          where: UserStatus.t.userId.equals(userId),
        );

        if (userStatus != null) {
          print('UserStatus found in the database.');
          // Update the existing UserStatus
          userStatus.isOnline = false;
          userStatus.lastSeen = DateTime.now();

          // Update the user status in the database
          await session.db.updateRow(userStatus);
        } else {
          // If no existing UserStatus, create a new entry
          print('UserStatus not found in the database.');
          userStatus = UserStatus(
            userId: userId,
            isOnline: false,
            lastSeen: DateTime.now(),
          );

          // Insert the new UserStatus into the database
          await session.db.insertRow(userStatus);
        }
      } catch (e) {
        print('stream opened userstatus db: $e');
      }

      // Remove the session from the manager
      streamingSessionManager.removeSession(userId);

      print('User $userId disconnected from the chat stream.');
    }

    return super.streamClosed(session);
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableModel message) async {
    print('Chat message received.');
    var authenticationInfo = await session.authenticated;
    var userId = authenticationInfo?.userId;

    if (userId == null) {
      print('User not authenticated.');
      return; // Ensure the user is authenticated
    }

    var data = message.toJson();
    var senderId = data['senderId'] as int;
    var receiverId = data['receiverId'] as int;
    var content = data['message'] as String;
    var messageType = data['messageType'] as String;

    // Validate sender
    if (senderId != userId) {
      print('Sender ID mismatch.');
      throw Exception('Sender ID mismatch.');
    }

    // Save the message to the database
    var chatMessage = ChatMessage(
      senderId: senderId,
      receiverId: receiverId,
      message: content,
      messageType: messageType,
      timestamp: DateTime.now(),
      isDelivered: false,
      isSeen: false,
      isActive: true,
      isTyping: false,
    );

    try {
      if (chatMessage.messageType != 'typing') {
        await session.db.insert<ChatMessage>([chatMessage]);
      }
    } catch (e) {
      print('handleStreamMessage db: $e');
    }

    // Forward the message to the receiver if they are connected
    print('Forwarding message to user $receiverId.');
    await session.messages.postMessage(
      '$receiverId', // Targeting the recipient
      chatMessage,
    );

    return super.handleStreamMessage(session, message);
  }

  Future<List<ChatMessage>> getMessages(
      Session session, int senderId, int receiverId) async {
    print('Retrieving messages for rec $receiverId sec $senderId');
    var messages = await session.db.find<ChatMessage>(
      where: (ChatMessage.t.receiverId.equals(receiverId) &
              ChatMessage.t.senderId.equals(senderId)) |
          (ChatMessage.t.receiverId.equals(senderId) &
              ChatMessage.t.senderId.equals(receiverId)),
    );
    return messages;
  }

  Future<void> handleTypingNotification(
      Session session, int senderId, int receiverId, bool isTyping) async {
    print('Typing notification received from user $senderId.');

    // Send typing notification to the receiver
    await session.messages.postMessage(
      '$receiverId',
      ChatMessage(
        senderId: senderId,
        receiverId: receiverId,
        message: '',
        messageType: 'typing',
        timestamp: DateTime.now(),
        isDelivered: false,
        isSeen: false,
        isActive: true,
        isTyping: isTyping,
      ),
    );
  }

  //find user by email
  Future<auth.UserInfo?> findUserByEmail(Session session, String email) async {
    print('Retrieving user by email $email');
    var user = await session.db.findFirstRow<auth.UserInfo>(
      where: auth.UserInfo.t.email.equals(email),
    );
    return user;
  }

  Future<List<auth.UserInfo>?> getChatListByUserId(Session session, int userId) async {
    List<int> userIds = [];
    final messages = await session.db.find<ChatMessage>(
      where: ChatMessage.t.senderId.equals(userId) | ChatMessage.t.receiverId.equals(userId),
    );

    for (var message in messages) {
      if (message.senderId != userId && !userIds.contains(message.senderId)) {
      userIds.add(message.senderId);
      } else if (message.receiverId != userId && !userIds.contains(message.receiverId)) {
      userIds.add(message.receiverId);
      }
    }

    List<auth.UserInfo> users = [];
    for (var id in userIds) {
      var user = await session.db.findFirstRow<auth.UserInfo>(
        where: auth.UserInfo.t.id.equals(id),
      );
      if (user != null) {
        users.add(user);
      }
    }

    return users;

  }

  
}

class StreamingSessionManager {
  final Map<int, StreamingSession> _sessions = {};

  // Add a session for a user
  void addSession(int userId, StreamingSession session) {
    print('Adding session for user $userId');
    _sessions[userId] = session;
  }

  // Remove a session for a user
  void removeSession(int userId) {
    print('Removing session for user $userId');
    _sessions.remove(userId);
  }

  // Retrieve the session for a specific user
  StreamingSession? getSession(int userId) {
    print('Retrieving session for user $userId');
    return _sessions[userId];
  }

  // Get userId by session
  int? getUserIdBySession(StreamingSession session) {
    print('Retrieving user ID by session');
    return _sessions.entries
        .firstWhere(
          (entry) => entry.value == session,
          orElse: () =>
              MapEntry(-1, session), // Return a placeholder if not found
        )
        .key;
  }
}

// Create a global instance of the session manager
var streamingSessionManager = StreamingSessionManager();
