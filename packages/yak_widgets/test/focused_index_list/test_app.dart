import 'package:flutter/material.dart';
import 'package:yak_widgets/yak_widgets.dart';

Widget focusedIndexListApp({
  required OnIndexChanged onIndexChanged,
  required VoidCallback onPressed,
  int? items,
  int? focus,
  int? initial,
  AlignmentGeometry? alignment,
}) =>
    MaterialApp(
      home: Material(
        child: FocusedIndexList(
          key: ValueKey('parent'),
          focusedIndex: focus ?? 0,
          initialIndex: initial ?? 0,
          childrenAlignment: alignment ?? Alignment.center,
          builder: (context, index, selected) {
            final child = FlutterLogo(key: ValueKey(index));
            return selected
                ? TextButton(onPressed: onPressed, child: child)
                : child;
          },
          itemCount: items ?? 5,
          onIndexChanged: onIndexChanged,
        ),
      ),
    );
