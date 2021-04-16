import 'package:flutter/material.dart';
import 'package:yak_widgets/yak_widgets.dart';

// !! uncomment the line below to run as test app
//void main() => runApp(app);

class Keys {
  static const parent = ValueKey('parent');
  static const trigger = ValueKey('trigger');
}

Widget get app => const MaterialApp(home: Material(child: _MyHomePage()));

class _MyHomePage extends StatefulWidget {
  const _MyHomePage() : super(key: const ValueKey('_MyHomePage'));

  @override
  __MyHomePageState createState() => __MyHomePageState();
}

class __MyHomePageState extends State<_MyHomePage> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          key: Keys.parent,
          itemBuilder: (context, index) =>
              Center(child: FlutterLogo(key: ValueKey(index))),
          controller: _pageController,
        ),
        Positioned(
          key: Keys.trigger,
          left: 0,
          child: Sidebar(
            onScroll: (forward) => forward
                ? _pageController.nextPage(
                    duration: kThemeAnimationDuration,
                    curve: Curves.fastOutSlowIn)
                : _pageController.previousPage(
                    duration: kThemeAnimationDuration,
                    curve: Curves.fastOutSlowIn),
            child: const ColoredBox(
              color: Color.fromRGBO(0, 0, 0, .3),
            ),
          ),
        ),
      ],
    );
  }
}
