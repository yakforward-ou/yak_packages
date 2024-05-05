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

FutureResult sendEmail(EmailData data) =>
    // Connect to the SMTP server
    Result.success(data.config)
        .thenRun(
          (config) => Socket.connect(config.host, config.port),
        )
        // Wait for the server's greeting message
        .runBypassAsync((socket) => socket.first)

        // Send EHLO command to initiate the conversation
        .runBypassAsync(
          (socket) => socket.writeln('EHLO ${data.payload.ehlo}'),
        )
        //   Read and discard server response
        .runBypassAsync((socket) => socket.flush())
        .runBypassAsync((socket) => socket.first)

        //   Send MAIL FROM command
        .runBypassAsync(
          (socket) => socket.writeln('MAIL FROM:<${data.payload.from}>'),
        )
        //   Read and discard server response
        .runBypassAsync((socket) => socket.flush())
        .runBypassAsync((socket) => socket.first)
//   Send RCPT TO command
        .runBypassAsync(
          (socket) => socket.writeln('RCPT TO:<${data.payload.to}>'),
        )
        //   Read and discard server response
        .runBypassAsync((socket) => socket.flush())
        .runBypassAsync((socket) => socket.first)

        //   Send DATA command to start email data
        .runBypassAsync(
          (socket) => socket.writeln(data.payload.data),
        )
        //   Read and discard server response
        .runBypassAsync((socket) => socket.flush())
        .runBypassAsync((socket) => socket.first)

        //   Send email content
        .runBypassAsync(
          (socket) => socket.writeln('Subject: ${data.payload.subject}'),
        )
        .runBypassAsync(
          (socket) => socket.writeln('From: <${data.payload.from}>'),
        )
        .runBypassAsync(
          (socket) => socket.writeln('To: <${data.payload.to}>'),
        )
        .runBypassAsync((socket) => socket.writeln(''))
        .runBypassAsync((socket) => socket.writeln(data.payload.body))
        .runBypassAsync((socket) => socket.writeln(''))
        //   Read and discard server response
        .runBypassAsync((socket) => socket.flush())
        .runBypassAsync((socket) => socket.first)

        //   Send QUIT command to close the connection
        .runBypassAsync(
          (socket) => socket.writeln('QUIT'),
        )
        .runBypassAsync((socket) => socket.flush())
        //   Close the socket

        .runBypassAsync((socket) => socket.close());
