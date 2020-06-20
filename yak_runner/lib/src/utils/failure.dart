import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  List<Object> get props => <Object>[];
}

class NullFailure extends Failure {}

class FunctionFailure extends Failure {}

class TimeoutFailure extends Failure {}

class HttpFailure extends Failure {}

class ValidationFailure extends Failure {}