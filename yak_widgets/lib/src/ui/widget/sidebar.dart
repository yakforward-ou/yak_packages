import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

/* [EXAMPLE]

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              MyPageView(),
              const YakSidebar(
                child: ColoredBox(color: Color.fromRGBO(0, 0, 0, .3)),
              ),
            ],
          ),
          floatingActionButton: const MyFloatingActionButton(),
        ),
      ),
    ),
  );
}

class MyPageView extends HookWidget {
  MyPageView() : super(key: const ValueKey('MsidebaryPageView'));
  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final duration = useProvider(animationDurationPod);
    final curve = useProvider(animationCurvePod);
    useProvider(sidebarPod)
        .useSidebarPageViewEffect(controller, duration.state, curve.state);
    return PageView.builder(
      itemBuilder: (context, _) => const Center(child: FlutterLogo(size: 160)),
      controller: controller,
    );
  }
}

class MyFloatingActionButton extends HookWidget {
  const MyFloatingActionButton()
      : super(key: const ValueKey('MyFloatingActionButton'));

  @override
  Widget build(BuildContext context) {
    final handedness = useProvider(handednessPod);
    return FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => handedness.state == Handedness.righthanded
            ? handedness.state = Handedness.lefthanded
            : handedness.state = Handedness.righthanded);
  }
}
*/

/// a ready to use widget that changes `sidebarPod` state

class YakSidebar extends HookWidget {
  const YakSidebar({
    this.child,
    this.scrollSensitivity = .001,
    this.width = 54,
    Key key = const ValueKey('YakSidebar'),
  }) : super(key: key);
  final double scrollSensitivity;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scroll = useProvider(sidebarPod);
    final height = MediaQuery.of(context).size.height;
    final threshold = height * scrollSensitivity;
    return YakHandedness(
      child: SizedBox(
        key: const ValueKey('YakSidebar: SizedBox'),
        height: height,
        width: width,
        child: GestureDetector(
          key: const ValueKey('YakSidebar: GestureDetector'),
          onVerticalDragUpdate: (details) {
            if (details.delta.dy.abs() > threshold &&
                details.delta.dx < threshold) {
              details.delta.dy < 0
                  ? scroll.state = SidebarScroll.up
                  : scroll.state = SidebarScroll.down;
            }
          },
          child: child,
        ),
      ),
    );
  }
}
