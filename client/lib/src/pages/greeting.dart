import 'package:client/src/controllers/greeting.dart';
import 'package:client/src/generated/greeting.pbgrpc.dart';
import 'package:client/src/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class GreetingPage extends StatelessWidget {
  static final String tag = "/greeting_page";

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) => store,
      builder: (context, callback) => Scaffold(
            appBar: AppBar(title: Text("Greeting Page")),
            body: Container(
              child: Center(child: Text("damn")),
            ),
          ),
    );
  }
}
