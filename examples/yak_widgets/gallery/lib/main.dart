import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:yak_widgets/yak_widgets.dart';

class Tab {
  const Tab(this.title, this.icon, this.content);

  final String title;
  final Icon icon;
  final Widget content;
}

final tabs = [
  Tab('Damper', Icon(Icons.star), DamperTab()),
  Tab('Sidebar', Icon(Icons.star), SideBarTab()),
  Tab('Handedness', Icon(Icons.star), HandednessTab()),
];

final activeTab = StateProvider<int>((_) => 0);

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Home(),
      ),
    ),
  );
}

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabIndex = useProvider(activeTab).state;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items:
            tabs.map((tab) => BottomNavigationBarItem(icon: tab.icon, label: tab.title)).toList(),
        onTap: (value) => context.read(activeTab).state = value,
        currentIndex: tabIndex,
      ),
      body: tabs[tabIndex].content,
    );
  }
}

class DamperTab extends HookWidget {
  const DamperTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _state = useProvider(damperStatePod);

    return Scaffold(
      body: Stack(children: [
        YakDamper(
          children: [
            FlutterLogo(size: MediaQuery.of(context).size.shortestSide),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _state.state =
            _state.state == DamperState.impose ? DamperState.withdraw : DamperState.impose,
        child: _state.state == DamperState.impose
            ? Icon(Icons.arrow_upward)
            : Icon(Icons.arrow_downward),
      ),
    );
  }
}

class SideBarTab extends StatelessWidget {
  const SideBarTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          const MyPageView(),
          const YakSidebar(
            child: ColoredBox(color: Color.fromRGBO(0, 0, 0, .3)),
          ),
        ],
      ),
    );
  }
}

class MyPageView extends HookWidget {
  const MyPageView() : super(key: const ValueKey('MySidebarPageView'));

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final duration = useProvider(animationDurationPod);
    final curve = useProvider(animationCurvePod);
    useProvider(sidebarPod).useSidebarPageViewEffect(controller, duration.state, curve.state);
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, _) => const Center(child: FlutterLogo(size: 160)),
      controller: controller,
    );
  }
}

class HandednessTab extends HookWidget {
  const HandednessTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _state = useProvider(handednessPod);
    return Scaffold(
      body: Stack(children: [
        YakHandedness(
          child: FlutterLogo(
            size: MediaQuery.of(context).size.shortestSide,
          ),
        ),
        const YakSidebar(
          child: ColoredBox(color: Color.fromRGBO(0, 0, 0, .3)),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _state.state = !_state.state,
        child: _state.state ? Icon(Icons.switch_right) : Icon(Icons.switch_left),
      ),
    );
  }
}
