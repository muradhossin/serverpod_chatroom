/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ChatMessage implements _i1.SerializableModel {
  ChatMessage._({
    this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.messageType,
    required this.timestamp,
    required this.isDelivered,
    required this.isSeen,
    required this.isActive,
    required this.isTyping,
  });

  factory ChatMessage({
    int? id,
    required int senderId,
    required int receiverId,
    required String message,
    required String messageType,
    required DateTime timestamp,
    required bool isDelivered,
    required bool isSeen,
    required bool isActive,
    required bool isTyping,
  }) = _ChatMessageImpl;

  factory ChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChatMessage(
      id: jsonSerialization['id'] as int?,
      senderId: jsonSerialization['senderId'] as int,
      receiverId: jsonSerialization['receiverId'] as int,
      message: jsonSerialization['message'] as String,
      messageType: jsonSerialization['messageType'] as String,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      isDelivered: jsonSerialization['isDelivered'] as bool,
      isSeen: jsonSerialization['isSeen'] as bool,
      isActive: jsonSerialization['isActive'] as bool,
      isTyping: jsonSerialization['isTyping'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int senderId;

  int receiverId;

  String message;

  String messageType;

  DateTime timestamp;

  bool isDelivered;

  bool isSeen;

  bool isActive;

  bool isTyping;

  ChatMessage copyWith({
    int? id,
    int? senderId,
    int? receiverId,
    String? message,
    String? messageType,
    DateTime? timestamp,
    bool? isDelivered,
    bool? isSeen,
    bool? isActive,
    bool? isTyping,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'messageType': messageType,
      'timestamp': timestamp.toJson(),
      'isDelivered': isDelivered,
      'isSeen': isSeen,
      'isActive': isActive,
      'isTyping': isTyping,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatMessageImpl extends ChatMessage {
  _ChatMessageImpl({
    int? id,
    required int senderId,
    required int receiverId,
    required String message,
    required String messageType,
    required DateTime timestamp,
    required bool isDelivered,
    required bool isSeen,
    required bool isActive,
    required bool isTyping,
  }) : super._(
          id: id,
          senderId: senderId,
          receiverId: receiverId,
          message: message,
          messageType: messageType,
          timestamp: timestamp,
          isDelivered: isDelivered,
          isSeen: isSeen,
          isActive: isActive,
          isTyping: isTyping,
        );

  @override
  ChatMessage copyWith({
    Object? id = _Undefined,
    int? senderId,
    int? receiverId,
    String? message,
    String? messageType,
    DateTime? timestamp,
    bool? isDelivered,
    bool? isSeen,
    bool? isActive,
    bool? isTyping,
  }) {
    return ChatMessage(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      message: message ?? this.message,
      messageType: messageType ?? this.messageType,
      timestamp: timestamp ?? this.timestamp,
      isDelivered: isDelivered ?? this.isDelivered,
      isSeen: isSeen ?? this.isSeen,
      isActive: isActive ?? this.isActive,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}
