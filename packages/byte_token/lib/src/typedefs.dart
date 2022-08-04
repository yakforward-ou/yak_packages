import 'package:yak_utils/yak_utils.dart';

typedef EncoderDelegate<T> = MultiDelegate2<T, T, T>;
typedef Bytes = List<int>;
typedef BytesEncoder = EncoderDelegate<Bytes>;
