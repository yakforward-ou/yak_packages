import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../yak_widgets.dart';

/// a widget that allows to select an action according to an index
class IndexSelector extends HookWidget {
  /// a list of widget
  final IndexedWidgetBuilder builder;

  /// the c
  final int itemCount;

  /// a callbackinitialData
  final OnIndexChanged? onIndexChanged;

  /// triggers on tap even if the index does not change
  final bool alwaysTriggerOnTap;

  /// no point for a const constructor
  IndexSelector({
    Key? key,
    this.onIndexChanged,
    this.alwaysTriggerOnTap = false,
    required this.builder,
    required this.itemCount,
  }) : super(key: key ?? UniqueKey());

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    final currentIndex = useState(0);

    OnIndexChanged scrollFromHeight(double height) {
      return (index) {
        controller.animateTo(
          height * index,
          duration: kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
        );
      };
    }

    return LayoutBuilder(
      key: ValueKey('LayoutBuilder@IndexedSelector:$key'),
      builder: (context, constraints) {
        final height = constraints.maxHeight / itemCount;
        final scroll = scrollFromHeight(height);
        GestureTapCallback onTap(index) {
          return currentIndex.value == index && !alwaysTriggerOnTap
              ? () {}
              : () {
                  currentIndex.value = index;
                  onIndexChanged?.call(index);
                  scroll(index);
                };
        }

        return ListView.builder(
          key: ValueKey('ListView.builder@IndexedSelector:$key'),
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) {
            final rem = index % itemCount;
            return SizedBox(
              key: ValueKey('SizedBox:$index@IndexedSelector:$key'),
              height: height,
              child: GestureDetector(
                key: ValueKey('GestureDetector$index@IndexedSelector:$key'),
                onTap: onTap(rem),
                child: Center(
                  key: ValueKey('Center$index@IndexedSelector:$key'),
                  child: builder(context, rem),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
