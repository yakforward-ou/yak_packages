import 'package:mockito/mockito.dart';
import 'package:yak_runner/yak_runner.dart';

/// a `Mock` for  `HandleErrorBase`
class MockHandleError<T extends Error> extends Mock
    implements HandleErrorBase<T> {}
