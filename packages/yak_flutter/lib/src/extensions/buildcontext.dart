import 'package:flutter/material.dart';

extension ThemeOfContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension TextThemeOfContextX on BuildContext {
  TextTheme get textTheme => theme.textTheme;
}

extension SizeOfContextX on BuildContext {
  Size get size => mediaQuery.size;
}

extension MediaQueryOfContextX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension PaddingOfContextX on BuildContext {
  EdgeInsets get padding => mediaQuery.padding;
}
