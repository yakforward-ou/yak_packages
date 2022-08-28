import 'package:byte_token/byte_token.dart';

const aYear = Duration(days: 356);
final now = DateTime.now();

final signature = ByteSignature(
  Secret('eyJ1c2VySWQiOiJhYmNkMTIzIiwiZXhwaXJ5IjoxNjQ2NjM1NjExMzAx'),
);

final payload = Payload(
  email: 'user@gmail.com',
  emailVerified: true,
  issuedAt: now.millisecondsSinceEpoch,
  expirationTime: now.add(aYear).millisecondsSinceEpoch,
);

final token = ByteToken(
  payload: payload,
  signature: signature(payload),
);

final validator = ByteTokenValidator(signature);

final validTokenOrThrow = validator(token);
