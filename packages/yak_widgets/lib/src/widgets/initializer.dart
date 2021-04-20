import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';

import '../../yak_widgets.dart';

/// a widget that provides a `loading screen`
class Initializer extends StatelessWidget {
  /// requires a `loadingScreen`
  final FractionalIndexItemBuilder loadingScreen;

  /// provides the state of the loading
  final ValueNotifier<Result<double>> progressState;

  /// provides the screen when loading is completed
  final WidgetBuilder onCompleted;

  /// provides the screen when loading has failed
  final WidgetBuilder onFailed;

  /// `Initializer`
  Initializer({
    required this.loadingScreen,
    required this.progressState,
    required this.onCompleted,
    required this.onFailed,
    Key key = const ValueKey('Initializer'),
  }) :
        // coverage:ignore-line
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Result<double>>(
      key: ValueKey('ValueListenableBuilder@$key'),
      valueListenable: progressState,
      builder: (context, value, _) {
        return value is Success
            ? (value as Success).data < 1
                ? loadingScreen(context, (value as Success).data)
                : onCompleted(context)
            : onFailed(context);
      },
    );
  }
}
