import '../../yak_error_handler.dart';

/// a function that recreate the behavior of `assert` pre-nnbd
/// the positionl `bool` is necessary to replicated `assert`
// ignore: avoid_positional_boolean_parameters
void avow(bool assertion, [Object? message]) {
  if (!assertion) {
    throw AvowError(message);
  }
}
