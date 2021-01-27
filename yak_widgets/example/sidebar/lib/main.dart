import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
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
  const MyPageView() : super(key: const ValueKey('MyPageView'));

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(sidebarPageControllerPod);
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, _) => FlutterLogo(),
    );
  }
}
