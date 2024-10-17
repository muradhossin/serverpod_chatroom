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
import 'dart:async' as _i2;
import 'package:chatroom_client/src/protocol/chat_message.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointChatMessage extends _i1.EndpointRef {
  EndpointChatMessage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chatMessage';

  _i2.Future<List<_i3.ChatMessage>> getMessages(
    int senderId,
    int receiverId,
  ) =>
      caller.callServerEndpoint<List<_i3.ChatMessage>>(
        'chatMessage',
        'getMessages',
        {
          'senderId': senderId,
          'receiverId': receiverId,
        },
      );

  _i2.Future<void> handleTypingNotification(
    int senderId,
    int receiverId,
    bool isTyping,
  ) =>
      caller.callServerEndpoint<void>(
        'chatMessage',
        'handleTypingNotification',
        {
          'senderId': senderId,
          'receiverId': receiverId,
          'isTyping': isTyping,
        },
      );

  _i2.Future<_i4.UserInfo?> findUserByEmail(String email) =>
      caller.callServerEndpoint<_i4.UserInfo?>(
        'chatMessage',
        'findUserByEmail',
        {'email': email},
      );

  _i2.Future<List<_i4.UserInfo>?> getChatListByUserId(int userId) =>
      caller.callServerEndpoint<List<_i4.UserInfo>?>(
        'chatMessage',
        'getChatListByUserId',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i4.Caller(client);
  }

  late final _i4.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    chatMessage = EndpointChatMessage(this);
    example = EndpointExample(this);
    modules = _Modules(this);
  }

  late final EndpointChatMessage chatMessage;

  late final EndpointExample example;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'chatMessage': chatMessage,
        'example': example,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
