import 'package:chatroom_client/chatroom_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ServerpodClientInitializer {
  late final SessionManager sessionManager;
  late final Client client;

  Future<void> initialize() async {
    client = Client(
      'http://192.168.1.14:8080/',
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

    sessionManager = SessionManager(
      caller: client.modules.auth,
    );

    await sessionManager.initialize();
  }
}

final serverpodClientInitializer = ServerpodClientInitializer();
