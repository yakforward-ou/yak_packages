import 'package:meta/meta.dart';
import 'package:yak_utils/yak_utils.dart';

/// a simple union class
@immutable
class Union<A, B> with JsonMixin {
  final A left;
  final B right;
  const Union(this.left, this.right);

  @override
  @nonVirtual
  bool operator ==(Object other) =>
      other is Union<A, B> && other.hashCode == hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(left, right, runtimeType);

  @override
  Json toJson() => {
        '$runtimeType': {
          'left': '$left',
          'right': '$right',
        }
      };
}
