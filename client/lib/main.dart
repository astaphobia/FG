import 'package:client/src/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:client/src/store/app_state.dart';
import 'package:client/src/pages/greeting.dart';
import 'package:client/src/pages/login.dart';
import 'package:client/src/routes.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'GRPC Client',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: StoreConnector<AppState, Store<AppState>>(
          converter: (Store<AppState> store) => store,
          builder: (context, Store<AppState> store) {
            if(store.state.token.isEmpty) {
              return Loginpage();
            }else{
              return GreetingPage();
            }
          },
        ),
        routes: routes,
      ),
    );
  }
}
