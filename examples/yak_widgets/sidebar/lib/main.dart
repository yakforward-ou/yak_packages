import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:yak_widgets/yak_widgets.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Material(
          child: Stack(
            children: [
              const MyPageView(),
              const YakSidebar(
                child: ColoredBox(color: Color.fromRGBO(0, 0, 0, .3)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyPageView extends HookWidget {
  const MyPageView() : super(key: const ValueKey('MsidebaryPageView'));
  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final duration = useProvider(animationDurationPod);
    final curve = useProvider(animationCurvePod);
    useProvider(sidebarPod)
        .useSidebarPageViewEffect(controller, duration.state, curve.state);
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, _) => const Center(child: FlutterLogo(size: 160)),
      controller: controller,
    );
  }
}
