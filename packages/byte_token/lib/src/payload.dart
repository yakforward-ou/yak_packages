import 'package:fixnum/fixnum.dart';
import 'package:yak_utils/yak_utils.dart';
import '../../protobufs/token.pb.dart' as buf;
import 'typedefs.dart';

/// TODO make a better version of protobuf.dart that just initialize everithing as 0 or '' as default
/// and behaves like a dataclass

class Payload {
  final String? accessTokenHashValue;
  final String? audience;
  final String? authorizedParty;
  final String? email;
  final bool emailVerified;
  final int? expirationTime;
  final String? hostedDomain;
  final int? issuedAt;
  final String? issuer;
  final String? nonce;
  final String? subject;

  const Payload({
    this.accessTokenHashValue,
    this.audience,
    this.authorizedParty,
    this.email,
    this.emailVerified = false,
    this.expirationTime,
    this.hostedDomain,
    this.nonce,
    this.issuer,
    this.issuedAt,
    this.subject,
  });

  factory Payload.fromBuffer(Bytes buffer) {
    final payload = buf.Payload.fromBuffer(buffer);
    return Payload(
      accessTokenHashValue: payload.accessTokenHashValue.isEmpty
          ? null
          : payload.accessTokenHashValue,
      audience: payload.audience.isEmpty ? null : payload.audience,
      authorizedParty:
          payload.authorizedParty.isEmpty ? null : payload.authorizedParty,
      email: payload.email.isEmpty ? null : payload.email,
      emailVerified: payload.emailVerified,
      expirationTime:
          payload.expirationTime < 1 ? null : payload.expirationTime.toInt(),
      hostedDomain: payload.hostedDomain.isEmpty ? null : payload.hostedDomain,
      issuedAt: payload.issuedAt < 1 ? null : payload.issuedAt.toInt(),
      issuer: payload.issuer.isEmpty ? null : payload.issuer,
      nonce: payload.nonce.isEmpty ? null : payload.nonce,
      subject: payload.subject.isEmpty ? null : payload.subject,
    );
  }
  Bytes toBuffer() {
    final payload = buf.Payload()
      ..accessTokenHashValue = accessTokenHashValue ?? ''
      ..audience = audience ?? ''
      ..authorizedParty = authorizedParty ?? ''
      ..email = email ?? ''
      ..emailVerified = emailVerified
      ..expirationTime = Int64(expirationTime ?? 0)
      ..hostedDomain = hostedDomain ?? ''
      ..issuedAt = Int64(issuedAt ?? 0)
      ..issuer = issuer ?? ''
      ..nonce = nonce ?? ''
      ..subject = subject ?? '';
    return payload.writeToBuffer();
  }

  Json toJson() => {
        'iss': issuer,
        'azp': authorizedParty,
        'aud': audience,
        'sub': subject,
        'at_hash': accessTokenHashValue,
        'email': email,
        'email_verified': '$emailVerified',
        'iat': issuedAt,
        'exp': expirationTime,
        'nonce': nonce,
        'hd': hostedDomain,
      };

  @override
  String toString() => '${toJson()}';

  @override
  bool operator ==(Object other) =>
      other is Payload && other.hashCode == hashCode;

  @override
  int get hashCode => Object.hashAll([
        accessTokenHashValue,
        audience,
        authorizedParty,
        email,
        emailVerified,
        expirationTime,
        hostedDomain,
        issuedAt,
        issuer,
        nonce,
        subject,
      ]);
}
