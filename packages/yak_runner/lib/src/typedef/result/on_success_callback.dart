import 'dart:async';

/// a callback that triggers when `Result` is a `Success`
typedef OnSuccessCallback<T> = FutureOr<void> Function(T);
