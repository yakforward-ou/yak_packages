import 'package:flutter/material.dart';
import 'package:yak_widgets/yak_widgets.dart';

main() => runApp(const MaterialApp(home: Material(child: MyHomePage())));

class MyHomePage extends StatefulWidget {
  const MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          itemBuilder: (context, index) =>
              Center(child: FlutterLogo(key: ValueKey(index))),
          controller: _pageController,
        ),
        Positioned(
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
