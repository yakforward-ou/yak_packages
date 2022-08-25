import 'package:flutter/material.dart';

extension ThemeOfContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension TextThemeOfContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension SizeOfContextX on BuildContext {
  Size get size => MediaQuery.of(this).size;
}

extension PaddingOfContextX on BuildContext {
  EdgeInsets get padding => MediaQuery.of(this).padding;
}
