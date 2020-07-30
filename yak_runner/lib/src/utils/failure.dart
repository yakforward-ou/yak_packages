import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  List<Object> get props => <Object>[];
}

class NullFailure extends Failure {
  const NullFailure();
}

class FunctionFailure extends Failure {
  const FunctionFailure();
}

class TimeoutFailure extends Failure {
  const TimeoutFailure();
}

class HttpFailure extends Failure {
  const HttpFailure();
}

class ValidationFailure extends Failure {
  const ValidationFailure();
}
