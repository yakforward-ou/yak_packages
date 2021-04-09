import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

// !! uncomment the line below to run as test app
//void main() => runApp(app);

Widget app(OnIndexChanged onIndexChanged) => ProviderScope(
      child: MaterialApp(
        home: Material(
          child: IndexSelector(
            builder: (context, index) => FlutterLogo(key: ValueKey(index)),
            itemCount: 5,
            onIndexChanged: onIndexChanged,
          ),
        ),
      ),
    );
