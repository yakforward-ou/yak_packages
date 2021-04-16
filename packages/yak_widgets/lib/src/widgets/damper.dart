import 'package:flutter/material.dart';

/// a ready to use widget that listens to a ValueNotifier
/// to animate in and out the screen

class Damper extends StatefulWidget {
  /// requires a `children` parameter
  final List<Widget> children;

  /// the duration of the damper animation
  final Duration duration;

  /// the curve of the damper animation
  final Curve curve;

  /// the state of the `damper`
  final ValueNotifier<bool> withdrawn;

  /// `YakDamper` constructor has parameters List<Widget> `children` and Key
  const Damper({
    required this.children,
    required this.withdrawn,
    this.curve = Curves.fastOutSlowIn,
    this.duration = kThemeAnimationDuration,
    Key key = const ValueKey('YakDamper'),
  })
  // coverage:ignore-line
  : super(key: key);

  @override
  _DamperState createState() => _DamperState();
}

class _DamperState extends State<Damper> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    widget.withdrawn.addListener(() {
      widget.withdrawn.value
          ? _animationController.forward()
          : _animationController.reverse();
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PositionedTransition(
      key: ValueKey('${widget.key}@PositionedTransition'),
      rect: RelativeRectTween(
        begin: RelativeRect.fromSize(
          Rect.fromLTWH(
            0,
            0,
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          MediaQuery.of(context).size,
        ),
        end: RelativeRect.fromSize(
            Rect.fromLTWH(
              0,
              -MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            MediaQuery.of(context).size),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: widget.curve,
        ),
      ),
      child: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        key: ValueKey('${widget.key}@SizedBox'),
        child: Stack(
          key: ValueKey('${widget.key}@Stack'),
          children: widget.children,
        ),
      ),
    );
  }
}
