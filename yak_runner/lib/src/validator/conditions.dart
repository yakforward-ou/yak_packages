import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'interfaces.dart';

/// [YakCondition] is a [callable] class that returns a [bool];
/// if the [condition] is not met it will trigger the [onFailure] callback, if provided
/// the arrow function [fail] will return [ValidationFailure] or the designated [failure]

class YakCondition<T> implements YakConditionInterface<T> {
  const YakCondition({
    @required this.condition,
    this.onFailure,
    this.failure,
  }) : assert(condition != null);
  final bool Function(T argument) condition;
  final void Function() onFailure;
  final Failure failure;

  @override
  @protected
  bool call(T argument) {
    final bool _pass = condition(argument);
    if(!_pass && onFailure != null) { onFailure(); }
    return _pass;
  }

  Failure get fail => failure ?? ValidationFailure();  
}

/// [NullCheck] extends [YakCondition], 
/// it verifies that the argument [dynamic] is not [null]
/// it doesn't have any callback and [fail] return a [NullFailure]

class NullCheck extends YakCondition<dynamic>{
  NullCheck() : super(
    condition: (dynamic arg) => arg != null,
    failure: NullFailure(),
  );
}