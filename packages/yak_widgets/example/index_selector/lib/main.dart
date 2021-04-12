import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef OnIndexChanged = void Function(int);

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

  final int focusedIndex;

  final Duration? duration;

  /// no point for a const constructor
  IndexSelector({
    Key? key,
    this.onIndexChanged,
    this.alwaysTriggerOnTap = false,
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
    final currentIndex = useState(focusedIndex);
    //final currentIndex = useState(0);

    OnIndexChanged scrollFromHeight(double height) {
      return (index) {
        controller.animateTo(
          height * index, //+ focusedIndex,
          duration: duration ?? kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
        );
      };
    }

    useMemoized(() {
      if (onIndexChanged != null) {
        currentIndex.addListener(() {
          onIndexChanged!(currentIndex.value);
        });
      }
    });

    return LayoutBuilder(
      key: ValueKey('LayoutBuilder@IndexedSelector:$key'),
      builder: (context, constraints) {
        final height = constraints.maxHeight / itemCount;
        final scroll = scrollFromHeight(height);

        GestureTapCallback onTap(index) {
          return () {
            currentIndex.value = index;
            scroll(index);
          };
        }

        return ListView.builder(
          key: ValueKey('ListView.builder@IndexedSelector:$key'),
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) {
            final rem = (index - focusedIndex).abs() % itemCount;
            return SizedBox(
              key: ValueKey('SizedBox:$index@IndexedSelector:$key'),
              height: height,
              child: ValueListenableBuilder<int>(
                key: ValueKey(
                  'ValueListenableBuilder:$index@IndexedSelector:$key',
                ),
                valueListenable: currentIndex,
                child: Center(
                  key: GlobalKey(
                    debugLabel: 'Center$index@IndexedSelector:$key',
                  ),
                  child: builder(context, rem),
                ),
                builder: (context, value, child) {
                  return value != rem
                      ? GestureDetector(
                          key: ValueKey(
                            'GestureDetector$index:@IndexedSelector:$key',
                          ),
                          onTap: onTap(rem),
                          child: AbsorbPointer(
                            key: ValueKey(
                              'AbsorbPointer$index:$value@IndexedSelector:$key',
                            ),
                            absorbing: true,
                            child: child,
                          ),
                        )
                      : child!;
                },
              ),
            );
          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: IndexSelector(
      duration: const Duration(milliseconds: 400),
      onIndexChanged: (i) => print('index changed to $i'),
      focusedIndex: 0,
      itemCount: 5,
      builder: (context, index) => TextButton(
        onPressed: () => print('$index pressed'),
        child: Text('$index'),
      ),
    ),
  ));
}
