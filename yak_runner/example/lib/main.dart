import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  static const _title = 'Yak Runner Sample App';
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: _title,
    home: MyHomePage(title: _title),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) => Scaffold(

  );
}
