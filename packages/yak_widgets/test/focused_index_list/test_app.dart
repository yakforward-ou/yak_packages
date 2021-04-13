import 'package:flutter/material.dart';
import 'package:yak_widgets/yak_widgets.dart';

// !! uncomment the line below to run as test app

Widget app(OnIndexChanged onIndexChanged) => MaterialApp(
      home: Material(
        child: FocusedIndexList(
          builder: (context, index, selected) => TextButton(
            key: ValueKey('$index'),
            onPressed: () {},
            child: Text('$index'),
          ),
          itemCount: 5,
          onIndexChanged: onIndexChanged,
        ),
      ),
    );
