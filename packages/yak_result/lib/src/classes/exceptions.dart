import 'package:meta/meta.dart';

@internal
sealed class ResultExceptions {
  static final notFailureException = Exception('Result is a Success');
  static final notSuccessException = Exception('Result is a Failure');
}
