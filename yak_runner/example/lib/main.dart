import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:yak/yak.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  static const _title = '[yak_runner] Sample App';
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

  /// [need to update package first]
  // int _counter = 1;
  // YakAsyncFunctionInterface<String,int> _swapi;
  // YakFunctionInterface<String,String> _decode;
  // YakAsyncFunction<String,int> _yakApi;
  // YakFunction<String,String> _yakDecode;
  // StreamController<String> _controller;

  // @override
  // void initState() {
  //   _controller = StreamController<String>();
  //   _swapi = SWApi();
  //   _decode = DecodeSwapiJson();
  //   _yakApi = Yak.asyncFunction<String,int>(function: _swapi);
  //   _yakDecode = Yak.function(function: _decode);
  //   super.initState();
  // }

  // void _fetch(int data) async {
  //   _yakDecode(await _yakApi(data));
  // }



  @override
  Widget build(BuildContext context) => Scaffold(

  );
}

class SWApi implements YakAsyncFunctionInterface<String,int> {
  static const String _url = 'https://swapi.dev/api/people/';

  @override
  FutureOr<String> call(FutureOr<int> argument) async {
    final int _i = await argument;
    final http.Response _res = await http.get(_url+'$_i');
    if (_res.statusCode != 200) {throw Error;}
    return _res.body;
  } 
}

class DecodeSwapiJson implements YakFunctionInterface<String,String> {
  @override
  String call(String argument) {
    final Map<String,dynamic> _json = jsonDecode( argument);
    return _json['name'] as String;
  }
}