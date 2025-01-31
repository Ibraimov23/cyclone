import 'package:cyclone/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    )),
    initialRoute: "/",
    routes: {
      '/': (context) => Home(),
    },
  ));
}
