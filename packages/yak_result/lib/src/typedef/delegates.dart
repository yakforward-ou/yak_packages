import 'package:yak_utils/yak_utils.dart'
    show
        NullaryDelegate,
        UnaryDelegate,
        NullaryDelegateAsync,
        UnaryDelegateAsync;

import '../all.dart';

/// a typedef [NullaryDelegate] of [Result]
typedef ResultNullaryDelegate<T> = NullaryDelegate<Result<T>>;

/// a typedef for an [UnaryDelegate] of [Result]
typedef ResultUnaryDelegate<T, S> = UnaryDelegate<Result<T>, S>;

/// a typedef for an [async] [NullaryDelegate] of [Result]
typedef ResultNullaryDelegateAsync<T> = NullaryDelegateAsync<Result<T>>;

/// a typedef for an [async] [UnaryDelegate] of [Result]
typedef ResultUnaryDelegateAsync<T, S> = UnaryDelegateAsync<Result<T>, S>;

/// a typedef [NullaryDelegate] of [VoidResult]
typedef VoidResultNullaryDelegate = NullaryDelegate<VoidResult>;

/// a typedef for an [UnaryDelegate] of [VoidResult]
typedef VoidResultUnaryDelegate<T> = UnaryDelegate<VoidResult, T>;

/// a typedef for an [async] [NullaryDelegate] of [VoidResult]
typedef VoidResultNullaryDelegateAsync = NullaryDelegateAsync<VoidResult>;

/// a typedef for an [async] [UnaryDelegate] of [VoidResult]
typedef VoidResultUnaryDelegateAsync<T> = UnaryDelegateAsync<VoidResult, T>;
