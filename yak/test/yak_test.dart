import 'package:flutter_test/flutter_test.dart';
import 'package:yak/yak.dart';


void main() {
 

  group('[Yak] imports succesfully [yak_runner] packages', () {
    test('Yak.function shoul return YakFunction class',() async {
      final YakFunction<int,int> _function = Yak.function<int,int>(function: (data) => data*2);
      final bool _result = _function != null;
      expect(_result, true);
    });

    test('Yak.generator shoul return YakGenerator class',() async {
      final YakGenerator<int> _function = Yak.generator<int>(function: () => 1);
      final bool _result = _function != null;
      expect(_result, true);
    });

    test('Yak.asyncFunction shoul return YakAsyncFunction class',() async {
      final YakAsyncFunction<int,int> _function = Yak.asyncFunction<int,int>(function: (data) async {
        final int _data = await data;
        return _data * 2;
      });
      final bool _result = _function != null;
      expect(_result, true);
    });

     test('Yak.asyncGenerator shoul return YakAsyncGenerator class',() async {
      final YakAsyncGenerator<int> _function = Yak.asyncGenerator<int>(function: () => 2);
      final bool _result = _function != null;
      expect(_result, true);
    });
  });
}