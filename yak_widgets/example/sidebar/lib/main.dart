import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:yak_widgets/yak_widgets.dart';

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
    final sidebar = useProvider(sidebarPod);
    final duration = useProvider(animationDurationPod).state;
    final curve = useProvider(animationCurvePod).state;

    sidebar.useSidebarPageViewEffect(
        controller, useProvider(animationDurationPod).state, duration, curve);
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
