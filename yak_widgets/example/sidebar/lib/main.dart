import 'package:flutter/material.dart';
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
              const YakSidebar(),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyPageView extends StatelessWidget {
  const MyPageView() : super(key: const ValueKey('MyPageView'));

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(sidebarPageControllerPod);
    return PageView.builder(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, _) => FlutterLogo(),
    );
  }
}
