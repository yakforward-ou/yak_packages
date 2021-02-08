import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

/// a ready to use `Positioned` that changes  according to`handednessPod` state

class YakHandedness extends HookWidget {
  YakHandedness({@required this.child, key}) : super(key: key ?? UniqueKey());
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final lefthanded = useProvider(handednessPod).state;
    return Positioned(
      key: ValueKey('$key: Positioned'),
      right: lefthanded ? null : 0,
      left: lefthanded ? 0 : null,
      child: child,
    );
  }
}