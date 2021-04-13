import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef OnIndexChanged = void Function(int);

typedef FocusedIndexedItemBuilder = Widget Function(
    BuildContext context, int index, bool focus);

/// a widget that allows to select an action according to an index
class FocusedIndexList extends HookWidget {
  /// a list of widget
  final FocusedIndexedItemBuilder builder;

  /// the number of item in the selector
  final int itemCount;

  /// a callbackinitialData
  final OnIndexChanged? onIndexChanged;

  final int focusedIndex;

  final Duration? duration;

  final AlignmentGeometry childrenAlignment;

  /// no point for a const constructor
  FocusedIndexList({
    Key? key,
    this.childrenAlignment = Alignment.center,
    this.onIndexChanged,
    this.focusedIndex = 0,
    this.duration,
    required this.builder,
    required this.itemCount,
  })  : assert(
          focusedIndex < itemCount,
          '`focusedIndex` should not be more than the idem couny',
        ),
        super(key: key ?? UniqueKey());

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    final focused = useState(focusedIndex);

    OnIndexChanged scrollFromHeight(double height) {
      return (remainder) {
        controller.animateTo(
          height * remainder,
          duration: duration ?? kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
        );
      };
    }

    return LayoutBuilder(
      key: ValueKey('LayoutBuilder@IndexedSelector:$key'),
      builder: (context, constraints) {
        final height = constraints.maxHeight / itemCount;
        final scroll = scrollFromHeight(height);

        return ListView.builder(
          key: ValueKey('ListView.builder@IndexedSelector:$key'),
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) {
            final remainder =
                (index - focusedIndex + itemCount).abs() % itemCount;
            final selected = focused.value == remainder;
            return SizedBox(
              height: height,
              child: GestureDetector(
                onTap: () {
                  if (!selected) {
                    onIndexChanged?.call(remainder);
                    focused.value = remainder;
                    scroll(remainder);
                  }
                },
                child: ValueListenableBuilder(
                  valueListenable: focused,
                  builder: (context, value, child) {
                    return Align(
                      alignment: childrenAlignment,
                      child: builder(
                        context,
                        remainder,
                        selected,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Material(
        child: FocusedIndexList(
          duration: const Duration(milliseconds: 400),
          onIndexChanged: (i) => print('index changed to $i'),
          focusedIndex: 2,
          itemCount: 5,
          builder: (context, index, selected) {
            final child = Text('$index');
            return selected
                ? TextButton(
                    onPressed: () => print('$index pressed'),
                    child: child,
                  )
                : child;
          },
        ),
      ),
    ),
  );
}




            // final center = Align(
            //   alignment: childrenAlignment ?? Alignment.center,
            //   key: ValueKey(
            //     'Center$index@IndexedSelector:$key',
            //   ),
            //   child: builder(context, remainder, selected.value == rem ),
            // );

            // final detector = GestureDetector(
            //   key: ValueKey(
            //     'GestureDetector$remainder:@IndexedSelector:$key',
            //   ),
            //   onTap: onTap(remainder),
            //   child: AbsorbPointer(
            //     key: ValueKey(
            //       'AbsorbPointer$remainder@IndexedSelector:$key',
            //     ),
            //     absorbing: true,
            //     child: center,
            //   ),
            // );

            // return SizedBox(
            //   key: ValueKey('SizedBox:$index@IndexedSelector:$key'),
            //   height: height,
            //   child: ValueListenableBuilder<int>(
            //     key: ValueKey(
            //       'ValueListenableBuilder:$index@IndexedSelector:$key',
            //     ),
            //     valueListenable: focused,
            //     builder: (context, value, child) {
            //       print('index: $index, value: $value, rem: $rem');
            //       return value != rem ? detector : center;
            //     },
            //   ),
            // );