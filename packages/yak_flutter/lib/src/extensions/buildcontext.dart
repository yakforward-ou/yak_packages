import 'package:flutter/material.dart';

/// A conveniniece extension to reduce boilerplate.
extension ThemeOfContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
}

/// A conveniniece extension to reduce boilerplate.
extension TextThemeOfContextX on BuildContext {
  TextTheme get textTheme => theme.textTheme;
}

/// A conveniniece extension to reduce boilerplate.
extension SizeOfContextX on BuildContext {
  Size get size => mediaQuery.size;
}

/// A conveniniece extension to reduce boilerplate.
extension MediaQueryOfContextX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

/// A conveniniece extension to reduce boilerplate.
extension PaddingOfContextX on BuildContext {
  EdgeInsets get padding => mediaQuery.padding;
}
