import 'payload.dart';

extension PayloadExpiredX on Payload {
  bool get isExpired => expirationTime == null
      ? true
      : DateTime.now().toUtc().millisecondsSinceEpoch > expirationTime!;
}

/// TODO this should go to yak_utils
extension IterableEqualityX<S, T extends Iterable<S>> on T {
  bool equals(T other) {
    if (length != other.length) {
      return false;
    }
    for (var i = 0; i < length; ++i) {
      if (other.elementAt(i) != elementAt(i)) {
        return false;
      }
    }
    return true;
  }
}
