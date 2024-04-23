import 'package:flutter/widgets.dart';

typedef Initialize<T> = T Function();
typedef Dispose<T> = void Function(T);

typedef HandleListener = void Function(VoidCallback);

extension type RestrictedNotifier<T extends Object>(ValueNotifier<T> notifier) {
  HandleListener get addListener => notifier.addListener;
  HandleListener get removeListener => notifier.removeListener;
  T get value => notifier.value;
  set value(T value) => notifier.value = value;
}

class InheritedRestrictedNotifier<T extends Object> extends InheritedWidget {
  const InheritedRestrictedNotifier({
    super.key,
    required this.notifier,
    required super.child,
  });

  final RestrictedNotifier<T> notifier;

  factory InheritedRestrictedNotifier.of(BuildContext context) {
    final inherited = context
        .dependOnInheritedWidgetOfExactType<InheritedRestrictedNotifier<T>>();
    if (inherited == null) {
      throw Exception(
          'InheritedRestrictedNotifier<$T> not found in BuildContext');
    }
    return inherited;
  }

  @override
  bool updateShouldNotify(InheritedRestrictedNotifier<T> oldWidget) => false;
}

class InheritedRestrictedNotifierdWidget<T extends Object>
    extends StatefulWidget {
  final Widget child;
  final T value;

  const InheritedRestrictedNotifierdWidget({
    super.key,
    required this.child,
    required this.value,
  });

  @override
  State<InheritedRestrictedNotifierdWidget<T>> createState() =>
      _InheritedRestrictedNotifierdWidgettState<T>();
}

class _InheritedRestrictedNotifierdWidgettState<T extends Object>
    extends State<InheritedRestrictedNotifierdWidget<T>> {
  late final ValueNotifier<T> notifier;
  @override
  void initState() {
    notifier = ValueNotifier(widget.value);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(context) => InheritedRestrictedNotifier<T>(
        notifier: RestrictedNotifier(notifier),
        child: widget.child,
      );
}
