import 'package:flutter/material.dart';
import 'package:client/src/pages/home.dart';
import 'package:client/src/pages/login.dart';
import 'package:client/src/pages/greeting.dart';

final routes = <String, WidgetBuilder>{
  HomePage.tag: (BuildContext context) => HomePage(),
  Loginpage.tag: (BuildContext context) => Loginpage(),
  GreetingPage.tag: (BuildContext context) => GreetingPage()
};
