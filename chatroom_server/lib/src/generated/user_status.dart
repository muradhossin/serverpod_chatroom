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

abstract class UserStatus extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  UserStatus._({
    int? id,
    required this.userId,
    required this.isOnline,
    required this.lastSeen,
    this.isTyping,
  }) : super(id);

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

  static final t = UserStatusTable();

  static const db = UserStatusRepository._();

  int userId;

  bool isOnline;

  DateTime lastSeen;

  bool? isTyping;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'isOnline': isOnline,
      'lastSeen': lastSeen.toJson(),
      if (isTyping != null) 'isTyping': isTyping,
    };
  }

  static UserStatusInclude include() {
    return UserStatusInclude._();
  }

  static UserStatusIncludeList includeList({
    _i1.WhereExpressionBuilder<UserStatusTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserStatusTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStatusTable>? orderByList,
    UserStatusInclude? include,
  }) {
    return UserStatusIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserStatus.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserStatus.t),
      include: include,
    );
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

class UserStatusTable extends _i1.Table {
  UserStatusTable({super.tableRelation}) : super(tableName: 'user_status') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    isOnline = _i1.ColumnBool(
      'isOnline',
      this,
    );
    lastSeen = _i1.ColumnDateTime(
      'lastSeen',
      this,
    );
    isTyping = _i1.ColumnBool(
      'isTyping',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnBool isOnline;

  late final _i1.ColumnDateTime lastSeen;

  late final _i1.ColumnBool isTyping;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        isOnline,
        lastSeen,
        isTyping,
      ];
}

class UserStatusInclude extends _i1.IncludeObject {
  UserStatusInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => UserStatus.t;
}

class UserStatusIncludeList extends _i1.IncludeList {
  UserStatusIncludeList._({
    _i1.WhereExpressionBuilder<UserStatusTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserStatus.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => UserStatus.t;
}

class UserStatusRepository {
  const UserStatusRepository._();

  Future<List<UserStatus>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<UserStatusTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserStatusTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStatusTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<UserStatus>(
      where: where?.call(UserStatus.t),
      orderBy: orderBy?.call(UserStatus.t),
      orderByList: orderByList?.call(UserStatus.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<UserStatus?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<UserStatusTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserStatusTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserStatusTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<UserStatus>(
      where: where?.call(UserStatus.t),
      orderBy: orderBy?.call(UserStatus.t),
      orderByList: orderByList?.call(UserStatus.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<UserStatus?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<UserStatus>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<UserStatus>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<UserStatus> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<UserStatus>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<UserStatus> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    UserStatus row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<UserStatus>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<UserStatus>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<UserStatus> rows, {
    _i1.ColumnSelections<UserStatusTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<UserStatus>(
      rows,
      columns: columns?.call(UserStatus.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<UserStatus> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    UserStatus row, {
    _i1.ColumnSelections<UserStatusTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<UserStatus>(
      row,
      columns: columns?.call(UserStatus.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<UserStatus>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<UserStatus> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<UserStatus>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<UserStatus> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    UserStatus row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<UserStatus>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<UserStatus>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<UserStatusTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<UserStatus>(
      where: where(UserStatus.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<UserStatusTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<UserStatus>(
      where: where?.call(UserStatus.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
