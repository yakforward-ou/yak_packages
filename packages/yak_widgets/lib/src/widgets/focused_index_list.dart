import 'package:flutter/material.dart';

import '../../../yak_widgets.dart';

/// a widget that allows to select an action according to an index
class FocusedIndexList extends StatefulWidget {
  /// a list of widget
  final FocusedIndexItemBuilder builder;

  /// the number of item in the selector
  final int itemCount;

  /// the index of the focused item
  /// defaults on `0`
  final int focusedIndex;

  /// the index of first item selected
  /// defaults on `0`
  final int initialIndex;

  /// a `void Function(int)` called when the selected index changes
  final OnIndexChanged? onIndexChanged;

  /// the duration of the scroll animation
  /// defaults on `kThemeAnimationDuration`
  final Duration duration;

  /// the alignment of the children in the list
  /// defaults on `Alignment.center`
  final AlignmentGeometry childrenAlignment;

  /// no point for a const constructor
  FocusedIndexList({
    Key? key,
    this.childrenAlignment = Alignment.center,
    this.focusedIndex = 0,
    this.initialIndex = 0,
    this.duration = kThemeAnimationDuration,
    this.onIndexChanged,
    required this.builder,
    required this.itemCount,
  })  : assert(
          focusedIndex < itemCount && focusedIndex >= 0,
          '`focusedIndex` value should be between `0` and `itemCount`',
        ),
        // coverage:ignore-line
        super(key: key ?? UniqueKey());

  @override
  _FocusedIndexListState createState() => _FocusedIndexListState();
}

class _FocusedIndexListState extends State<FocusedIndexList> {
  late final ScrollController _controller;
  late final ValueNotifier<int> _selectedIndex;
  @override
  void initState() {
    _selectedIndex = ValueNotifier(widget.initialIndex);
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _selectedIndex.dispose();
    super.dispose();
  }

  OnIndexChanged scrollFromHeight(double height) {
    return (remainder) {
      _controller.animateTo(
        height * remainder,
        duration: widget.duration,
        curve: Curves.fastOutSlowIn,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: ValueKey('LayoutBuilder@FocusedIndexList:${widget.key}'),
      builder: (context, constraints) {
        final height = constraints.maxHeight / widget.itemCount;
        final scroll = scrollFromHeight(height);

        return ListView.builder(
          key: ValueKey('ListView.builder@FocusedIndexList:${widget.key}'),
          cacheExtent: 0,
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          itemBuilder: (context, index) {
            final remainder =
                (index - widget.focusedIndex + widget.itemCount).abs() %
                    widget.itemCount;
            return SizedBox(
              key: ValueKey('SizedBox@FocusedIndexList:${widget.key}'),
              height: height,
              child: GestureDetector(
                key: ValueKey('GestureDetector@FocusedIndexList:${widget.key}'),
                onTap: () {
                  widget.onIndexChanged?.call(remainder);
                  _selectedIndex.value = remainder;
                  scroll(remainder);
                },
                child: ValueListenableBuilder(
                  key: ValueKey(
                    'ValueListenableBuilder@FocusedIndexList:${widget.key}',
                  ),
                  valueListenable: _selectedIndex,
                  builder: (context, value, child) {
                    return Align(
                      key: ValueKey('Align@FocusedIndexList:${widget.key}'),
                      alignment: widget.childrenAlignment,
                      child: widget.builder(
                        context,
                        remainder,
                        value == remainder,
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
