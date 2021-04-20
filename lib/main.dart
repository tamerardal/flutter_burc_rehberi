import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/horoscope_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HoroscopeList(),
    );
  }
}
