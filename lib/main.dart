import 'package:cyclone/pages/Instruction.dart';
import 'package:cyclone/pages/chatbot.dart';
import 'package:cyclone/pages/confirming.dart';
import 'package:cyclone/pages/create.dart';
import 'package:cyclone/pages/empty.dart';
import 'package:cyclone/pages/home.dart';
import 'package:cyclone/pages/id.dart';
import 'package:cyclone/pages/intro.dart';
import 'package:cyclone/pages/language.dart';
import 'package:cyclone/pages/login.dart';
import 'package:cyclone/pages/newpassowrd.dart';
import 'package:cyclone/pages/pages.dart';
import 'package:cyclone/pages/passport.dart';
import 'package:cyclone/pages/profile.dart';
import 'package:cyclone/pages/shop.dart';
import 'package:cyclone/pages/signin.dart';
import 'package:cyclone/pages/taable.dart';
import 'package:cyclone/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
      )),
      initialRoute: "/",
      routes: {
        '/': (context) => Pages(),
        '/chatbot': (context) => Chatbot(),
        '/passport': (context) => Passport(),
        '/home': (context) => Home(),
        '/language': (context) => LanguageSelectionScreen(),
        '/welcome': (context) => Welcome(),
        "/signin": (context) => Sigin(),
        "/login": (context) => Login(),
        "/newpassport": (context) => Newpassowrd(),
        "/confirming": (context) => Confirming(),
        "/empty": (context) => Empty(),
        "/create": (context) => Create(),
        "/profile": (context) => Profile(),
        "/intro": (context) => Intro(),
        "/instruction": (context) => Instruction(),
        "/id": (context) => Id(),
        "/shop": (context) => Shop(),
        "/taable": (context) => Taable()
      }));
}
