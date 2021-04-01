import 'package:stub/src/method/all.dart';
import 'package:test/test.dart';

// ignore_for_file: avoid_catching_errors

const _unimplementedCode = 1;
const _assertionCode = 2;
const _exceptionCode = 3;
const _okCode = 4;

class Wrap {
  void Function() fun;
  Wrap(this.fun);
  int call() {
    try {
      fun();
    } on UnimplementedError catch (e) {
      if (e is UnimplementedError) {
        print(e.message);
        print(e.stackTrace);

        return _unimplementedCode;
      }
    } on AssertionError catch (e) {
      if (e is AssertionError) {
        return _assertionCode;
      }
    } on Exception catch (e) {
      if (e is Exception) {
        return _exceptionCode;
      }
    }
    return _okCode;
  }
}

void main() {
  group('`Stub` in "nested delegate"', () {
    final method = nullaryStub<void>();
    final fooWrap = Wrap(method.stub);

    test(
        'GIVEN an unimplemented stub` '
        'WHEN method is called '
        'THEN error flows through the "nested" class', () {
      expect(
        fooWrap(),
        _unimplementedCode,
        reason: '`should return unimplemented code`',
      );
    });
    test(
        'GIVEN an stub set up` '
        'WHEN method is called '
        'THEN return result', () {
      method.stub = () {};
      expect(
        fooWrap(),
        _okCode,
        reason: 'should return ok code',
      );
    });
  });
}
