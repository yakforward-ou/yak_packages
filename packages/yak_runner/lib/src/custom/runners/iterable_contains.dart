// !!! TODO consider merging in yak_runner package
import 'package:yak_hive/src/utils/yak_runner/errors/bool_check_false.dart';
import 'package:yak_runner/yak_runner.dart';

/// a `YakRunnerArg` that returns a T if contained in a given iterable
class YakRunnerIterableContains<T> extends YakRunnerArg<T, T> {
  /// a list of elements
  final Iterable<T> elements;

  ///
  YakRunnerIterableContains(this.elements)
      : super((element) {
          return elements.contains(element)
              ? element
              : throw Exception('iterable $elements does not contain $element');
        }, null, {
          HandleError<BoolCheckFalse>((_) {}),
        });
}

/// an extension on `Iterable` to easily access the result
extension YakRunnerIterableContainsExtension<T> on Iterable<T> {
  /// returns a `YakRunnerArg` from an Iterable
  YakRunnerArg<T, T> get containsResult => YakRunnerIterableContains(this);
}
