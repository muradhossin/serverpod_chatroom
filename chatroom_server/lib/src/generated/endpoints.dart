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
import '../endpoints/chatmessage_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'chatMessage': _i2.ChatMessageEndpoint()
        ..initialize(
          server,
          'chatMessage',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['chatMessage'] = _i1.EndpointConnector(
      name: 'chatMessage',
      endpoint: endpoints['chatMessage']!,
      methodConnectors: {
        'getMessages': _i1.MethodConnector(
          name: 'getMessages',
          params: {
            'senderId': _i1.ParameterDescription(
              name: 'senderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'receiverId': _i1.ParameterDescription(
              name: 'receiverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chatMessage'] as _i2.ChatMessageEndpoint).getMessages(
            session,
            params['senderId'],
            params['receiverId'],
          ),
        ),
        'handleTypingNotification': _i1.MethodConnector(
          name: 'handleTypingNotification',
          params: {
            'senderId': _i1.ParameterDescription(
              name: 'senderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'receiverId': _i1.ParameterDescription(
              name: 'receiverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'isTyping': _i1.ParameterDescription(
              name: 'isTyping',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chatMessage'] as _i2.ChatMessageEndpoint)
                  .handleTypingNotification(
            session,
            params['senderId'],
            params['receiverId'],
            params['isTyping'],
          ),
        ),
        'findUserByEmail': _i1.MethodConnector(
          name: 'findUserByEmail',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chatMessage'] as _i2.ChatMessageEndpoint)
                  .findUserByEmail(
            session,
            params['email'],
          ),
        ),
        'getChatListByUserId': _i1.MethodConnector(
          name: 'getChatListByUserId',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chatMessage'] as _i2.ChatMessageEndpoint)
                  .getChatListByUserId(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i4.Endpoints()..initializeEndpoints(server);
  }
}
