import 'package:serverpod/serverpod.dart';

import 'package:chatroom_server/src/web/routes/root.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  Future<bool> sendEmail(
      Session session, String email, String subject, String text) async {
    final smtpServer = SmtpServer(session.serverpod.getPassword('smtphost')!,
        username: session.serverpod.getPassword('smtpuser'),
        password: session.serverpod.getPassword('smtppassword'));

    final message = Message()
      ..from = Address('a.m.adnanmurad@gmail.com', 'Md Murad Hossin')
      ..recipients.add(email)
      ..subject = subject
      ..text = text;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      return true;
    } on MailerException catch (e) {
      print('Message not sent. \n' + e.toString());
      return false;
    }
  }

  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      return await sendEmail(session, email, 'Validation Code',
          'Your validation code is $validationCode');
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      return await sendEmail(session, userInfo.email.toString(),
          'Password Reset', 'Your validation code is $validationCode');
    },
  ));

  // Start the server.
  await pod.start();
}
