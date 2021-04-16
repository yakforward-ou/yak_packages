import 'package:flutter/material.dart';
import 'package:yak_widgets/yak_widgets.dart';

Widget focusedIndexListApp({
  required OnIndexChanged onIndexChanged,
  required VoidCallback onPressed,
}) =>
    MaterialApp(
      home: Material(
        child: FocusedIndexList(
          builder: (context, index, selected) {
            final child = FlutterLogo(key: ValueKey(index));
            return selected
                ? TextButton(onPressed: onPressed, child: child)
                : child;
          },
          itemCount: 5,
          onIndexChanged: onIndexChanged,
        ),
      ),
    );
