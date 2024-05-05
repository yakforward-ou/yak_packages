import 'dart:io';
import 'package:yak_runner/yak_runner.dart';

typedef SocketConfig = ({String host, int port});

typedef EmailData = ({
  SocketConfig config,
  EmailPayload payload,
});

final class EmailPayload {
  const EmailPayload({
    required this.ehlo,
    required this.data,
    required this.subject,
    required this.from,
    required this.to,
    required this.body,
  });
  final String ehlo, data, subject, from, to, body;
}

Future<Socket> _socket(SocketConfig config) =>
    Socket.connect(config.host, config.port);

Future<void> sendEmail(EmailData data) async {
  // Connect to the SMTP server
  _socket
      .runAsync(data.config)
      // Wait for the server's greeting message
      .runBypassAsync((socket) => socket.first)

// Send EHLO command to initiate the conversation
   .runBypassAsync((socket)  {Future.sync(() => socket.writeln('EHLO ${data.payload.ehlo}'));})
//   //socket.writeln('EHLO ${data.payload.ehlo}');

//   await socket.flush();

//   // Read and discard server response
//   await socket.first;

//   // Send MAIL FROM command
//   socket.writeln('MAIL FROM:<${data.payload.from}>');
//   await socket.flush();
//   await socket.first;

//   // Send RCPT TO command
//   socket.writeln('RCPT TO:<${data.payload.to}>');
//   await socket.flush();
//   await socket.first;

//   // Send DATA command to start email data
//   socket.writeln(data.payload.data);
//   await socket.flush();
//   await socket.first;

//   // Send email content
//   socket.writeln('Subject: ${data.payload.subject}');
//   socket.writeln('From: <${data.payload.from}');
//   socket.writeln('To: <${data.payload.to}');
//   socket.writeln('');
//   socket.writeln(data.payload.body);
//   socket.writeln('.');

//   // Flush the socket and read server response
//   await socket.flush();
//   await socket.first;

//   // Send QUIT command to close the connection
//   socket.writeln('QUIT');
//   await socket.flush();

//   // Close the socket
//   await socket.close();
}
