/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ChatMessage extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  ChatMessage._({
    int? id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.messageType,
    required this.timestamp,
    required this.isDelivered,
    required this.isSeen,
    required this.isActive,
    required this.isTyping,
  }) : super(id);

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

  static final t = ChatMessageTable();

  static const db = ChatMessageRepository._();

  int senderId;

  int receiverId;

  String message;

  String messageType;

  DateTime timestamp;

  bool isDelivered;

  bool isSeen;

  bool isActive;

  bool isTyping;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ChatMessageInclude include() {
    return ChatMessageInclude._();
  }

  static ChatMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatMessageTable>? orderByList,
    ChatMessageInclude? include,
  }) {
    return ChatMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChatMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ChatMessage.t),
      include: include,
    );
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

class ChatMessageTable extends _i1.Table {
  ChatMessageTable({super.tableRelation}) : super(tableName: 'chat_message') {
    senderId = _i1.ColumnInt(
      'senderId',
      this,
    );
    receiverId = _i1.ColumnInt(
      'receiverId',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    messageType = _i1.ColumnString(
      'messageType',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    isDelivered = _i1.ColumnBool(
      'isDelivered',
      this,
    );
    isSeen = _i1.ColumnBool(
      'isSeen',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    isTyping = _i1.ColumnBool(
      'isTyping',
      this,
    );
  }

  late final _i1.ColumnInt senderId;

  late final _i1.ColumnInt receiverId;

  late final _i1.ColumnString message;

  late final _i1.ColumnString messageType;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnBool isDelivered;

  late final _i1.ColumnBool isSeen;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnBool isTyping;

  @override
  List<_i1.Column> get columns => [
        id,
        senderId,
        receiverId,
        message,
        messageType,
        timestamp,
        isDelivered,
        isSeen,
        isActive,
        isTyping,
      ];
}

class ChatMessageInclude extends _i1.IncludeObject {
  ChatMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ChatMessage.t;
}

class ChatMessageIncludeList extends _i1.IncludeList {
  ChatMessageIncludeList._({
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ChatMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ChatMessage.t;
}

class ChatMessageRepository {
  const ChatMessageRepository._();

  Future<List<ChatMessage>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<ChatMessage>(
      where: where?.call(ChatMessage.t),
      orderBy: orderBy?.call(ChatMessage.t),
      orderByList: orderByList?.call(ChatMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<ChatMessage?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<ChatMessage>(
      where: where?.call(ChatMessage.t),
      orderBy: orderBy?.call(ChatMessage.t),
      orderByList: orderByList?.call(ChatMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<ChatMessage?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<ChatMessage>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<ChatMessage>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<ChatMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<ChatMessage>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<ChatMessage> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    ChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<ChatMessage>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<ChatMessage>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<ChatMessage> rows, {
    _i1.ColumnSelections<ChatMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<ChatMessage>(
      rows,
      columns: columns?.call(ChatMessage.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<ChatMessage> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    ChatMessage row, {
    _i1.ColumnSelections<ChatMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<ChatMessage>(
      row,
      columns: columns?.call(ChatMessage.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<ChatMessage>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<ChatMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<ChatMessage>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<ChatMessage> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    ChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<ChatMessage>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<ChatMessage>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<ChatMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<ChatMessage>(
      where: where(ChatMessage.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<ChatMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<ChatMessage>(
      where: where?.call(ChatMessage.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
