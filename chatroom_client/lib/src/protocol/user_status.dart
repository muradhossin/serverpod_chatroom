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

abstract class UserStatus implements _i1.SerializableModel {
  UserStatus._({
    this.id,
    required this.userId,
    required this.isOnline,
    required this.lastSeen,
    this.isTyping,
  });

  factory UserStatus({
    int? id,
    required int userId,
    required bool isOnline,
    required DateTime lastSeen,
    bool? isTyping,
  }) = _UserStatusImpl;

  factory UserStatus.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserStatus(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      isOnline: jsonSerialization['isOnline'] as bool,
      lastSeen:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastSeen']),
      isTyping: jsonSerialization['isTyping'] as bool?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  bool isOnline;

  DateTime lastSeen;

  bool? isTyping;

  UserStatus copyWith({
    int? id,
    int? userId,
    bool? isOnline,
    DateTime? lastSeen,
    bool? isTyping,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'isOnline': isOnline,
      'lastSeen': lastSeen.toJson(),
      if (isTyping != null) 'isTyping': isTyping,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserStatusImpl extends UserStatus {
  _UserStatusImpl({
    int? id,
    required int userId,
    required bool isOnline,
    required DateTime lastSeen,
    bool? isTyping,
  }) : super._(
          id: id,
          userId: userId,
          isOnline: isOnline,
          lastSeen: lastSeen,
          isTyping: isTyping,
        );

  @override
  UserStatus copyWith({
    Object? id = _Undefined,
    int? userId,
    bool? isOnline,
    DateTime? lastSeen,
    Object? isTyping = _Undefined,
  }) {
    return UserStatus(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
      isTyping: isTyping is bool? ? isTyping : this.isTyping,
    );
  }
}
