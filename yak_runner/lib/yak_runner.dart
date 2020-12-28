library yak_runner;

/// [delegates] # # # # # #

/// # # # [arg]
export 'src/delegates/arg/any/async_delegate.dart';
export 'src/delegates/arg/any/delegate.dart';
export 'src/delegates/arg/void/async_delegate.dart';
export 'src/delegates/arg/void/delegate.dart';

/// # # # [base]
export 'src/delegates/base/arg_delegate.dart';
export 'src/delegates/base/future_arg_delegate.dart';
export 'src/delegates/base/delegate.dart';
export 'src/delegates/base/future_delegate.dart';
export 'src/delegates/base/error_handler.dart';

/// # # # [simple]
export 'src/delegates/simple/any/async_delegate.dart';
export 'src/delegates/simple/any/delegate.dart';
export 'src/delegates/simple/void/async_delegate.dart';
export 'src/delegates/simple/void/delegate.dart';

/// # # # [test]
export 'src/delegates/test/arg_result_test_delegate.dart';
export 'src/delegates/test/arg_test_delegate.dart';
export 'src/delegates/test/result_test_delegate.dart';

/// # # # [test factory]

export 'src/delegates/test_factory/arg_result_test_factory_delegate.dart';
export 'src/delegates/test_factory/arg_test_factory_delegate.dart';
export 'src/delegates/test_factory/result_test_factory_delegate.dart';

/// # # # [tryarg]

export 'src/delegates/tryarg/any/async_delegate.dart';
export 'src/delegates/tryarg/any/delegate.dart';
export 'src/delegates/tryarg/void/async_delegate.dart';
export 'src/delegates/tryarg/void/delegate.dart';

/// # # # [trytry]

export 'src/delegates/trytry/delegate.dart';
export 'src/delegates/trytry/async_delegate.dart';

/// [freezed] # # # # # #

export 'src/freezed/any/sync.dart';
export 'src/freezed/void/sync.dart';

/// [freezed] # # # # # #
///
// `I'll keep it internal to the package for now`

/// [results] # # # # # #

export 'src/results/failure.dart';
export 'src/results/result.dart';
export 'src/results/success.dart';
