import 'package:mockito/mockito.dart';
import 'package:yak_runner/src/classes/all.dart';

class MockHandleError<T extends Error> extends Mock
    implements HandleErrorBase<T> {}
