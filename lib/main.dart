import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/horoscope_detail.dart';

import 'horoscope_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,
      initialRoute: "/horoscopeList",
      routes: {
        "/": (context) => HoroscopeList(),
        "/horoscopeList": (context) => HoroscopeList(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElement = settings.name.split("/");
        if (pathElement[1] == 'horoscopeDetail') {
          return MaterialPageRoute(
              builder: (context) => HoroscopeDetail(int.parse(pathElement[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
