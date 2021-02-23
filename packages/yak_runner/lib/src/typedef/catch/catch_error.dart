import 'package:yak_runner/src/all.dart';

/// a typedef for a function that takes an Error or a its extension as arg

typedef CatchError<T extends Error> = void Function<T>(Error e);
