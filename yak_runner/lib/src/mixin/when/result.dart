import 'package:meta/meta.dart';
import '../../classes/result/all.dart';

mixin WhenResult<T> on ResultBase<T> {
  Z when<Z>({
    @required Z Function(T) success,
    @required Z Function(Object, StackTrace) failure,
  });
}
