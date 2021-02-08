import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

// !! uncomment the line below to run as test app
//void main() => runApp(app);

class Keys {
  static final parent = UniqueKey();
  static final trigger = UniqueKey();
}

Widget get app => ProviderScope(
      child: MaterialApp(
        home: Stack(
          children: [
            const _MyPageView(),
            YakSidebar(
              key: Keys.trigger,
              child: const ColoredBox(
                color: Color.fromRGBO(0, 0, 0, .3),
              ),
            ),
          ],
        ),
      ),
    );

class _MyPageView extends HookWidget {
  const _MyPageView() : super(key: const ValueKey('_MyPageView'));
  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final duration = useProvider(animationDurationPod);
    final curve = useProvider(animationCurvePod);
    useProvider(sidebarPod)
        .useSidebarPageViewEffect(controller, duration.state, curve.state);
    return PageView.builder(
      key: Keys.parent,
      itemBuilder: (context, index) =>
          Center(child: FlutterLogo(key: ValueKey(index))),
      controller: controller,
    );
  }
}
