import 'payload.dart';

extension PayloadExpiredX on Payload {
  bool get isExpired => expirationTime == null
      ? true
      : DateTime.now().toUtc().millisecondsSinceEpoch > expirationTime!;
}

/// TODO this should go to yak_utils
