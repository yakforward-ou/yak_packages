import 'dart:convert';

import 'package:meta/meta.dart';

import '../types/all.dart';

/// a utility mixin that overrides to string
/// and readies the object for [dart:convert] compatibility
mixin JsonMixin on Object {
  Json toJson();

  /// [toString] returns encoded json
  @override
  @nonVirtual
  String toString() => jsonEncode(toJson());
}
