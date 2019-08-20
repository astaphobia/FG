import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String tag = "/home_page";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Container(
        child: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
