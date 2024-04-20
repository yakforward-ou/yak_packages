import 'package:flutter/material.dart';

/// wraps a [PreferredSizeWidget] child in a [Theme] [Widget]
class PreferredSizeWidgetThemed extends StatelessWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget child;
  final ThemeData data;
  const PreferredSizeWidgetThemed({
    required this.child,
    required this.data,
    super.key,
  });
  @override
  Widget build(context) => Theme(data: data, child: child);

  @override
  Size get preferredSize => child.preferredSize;
}
