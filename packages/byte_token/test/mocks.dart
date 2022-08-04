import 'package:byte_token/byte_token.dart';

Secret get validSecret =>
    Secret('eyJ1c2VySWQiOiJhYmNkMTIzIiwiZXhwaXJ5IjoxNjQ2NjM1NjExMzAx');

ByteSignature get validSignature => ByteSignature(validSecret);

const _oneDay = Duration(days: 1);
const _oneYear = Duration(days: 365);
final _aYearAgo = DateTime.now().toUtc().add(-_oneYear).millisecondsSinceEpoch;
final _yesterday = DateTime.now().toUtc().add(-_oneDay).millisecondsSinceEpoch;
final _tomorrow = DateTime.now().toUtc().add(_oneDay).millisecondsSinceEpoch;

Payload get validPayload => Payload(
      email: 'yakforward@gmail.com',
      emailVerified: true,
      issuedAt: _aYearAgo,
      expirationTime: _tomorrow,
    );

Payload get badPayload => Payload(
      email: 'bad_actor@gmail.com',
      emailVerified: true,
      issuedAt: _aYearAgo,
      expirationTime: _tomorrow,
    );

Payload get expiredPayload => Payload(
      email: 'yakforward@gmail.com',
      emailVerified: true,
      issuedAt: _aYearAgo,
      expirationTime: _yesterday,
    );

ByteToken get validToken => ByteToken(
      payload: validPayload,
      signature: validSignature(validPayload),
    );

ByteToken get badToken => ByteToken(
      payload: badPayload,
      signature: validSignature(validPayload),
    );

ByteToken get expiredToken => ByteToken(
      payload: validPayload,
      signature: validSignature(validPayload),
    );

ByteTokenValidator get validator => ByteTokenValidator(validSignature);
