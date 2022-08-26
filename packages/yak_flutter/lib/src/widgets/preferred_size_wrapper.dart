import 'package:flutter/material.dart';

/// wraps a [PreferredSizeWidget] child in a [Theme] [Widget]
class PreferredSizeWidgetWrapper extends StatelessWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget child;
  final ThemeData data;
  const PreferredSizeWidgetWrapper({
    required this.child,
    required this.data,
    super.key,
  });
  @override
  Widget build(BuildContext context) => Theme(data: data, child: child);

  @override
  Size get preferredSize => child.preferredSize;
}
