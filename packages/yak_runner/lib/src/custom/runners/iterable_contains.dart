import '../../all.dart';

/// a `YakRunnerArg` that returns a T if contained in a given iterable
class IterableContains<T> extends YakRunnerArg<T, T> {
  /// an iterable of elements of type <T>
  final Iterable<T> elements;

  ///
  IterableContains(this.elements)
      : super(
          (element) {
            assert(elements.contains(element));
            return element;
          },
          errorsWhitelist: {AssertionError().ignore},
        );
}
