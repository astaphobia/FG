import 'package:client/src/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:client/src/controllers/login.dart';
import 'package:client/src/utils/auth.dart';
import 'package:client/src/utils/helpers.dart';
import 'package:client/src/components/alert.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Loginpage extends StatefulWidget {
  static final String tag = "/login_page";

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  String email;
  String password;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Text(
              'LOGIN FORM',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Form(
              key: _key,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "xxx@email.com",
                      labelText: "Email",
                      icon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                    onSaved: (value) {
                      email = value.toUpperCase();
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "email cannot be empty";
                      } else {
                        Validation validation = new Validation();
                        if (!validation.email(value)) {
                          return "email is not valid";
                        }
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "secret",
                      icon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                    ),
                    onSaved: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                  ),
                  StoreConnector<AppState, Store<AppState>>(
                    converter: (Store<AppState> store) => store,
                    builder: (context, callback) => Padding(
                          padding: EdgeInsets.all(10.0),
                          child: RaisedButton(
                            child: Text("LOGIN"),
                            color: Colors.purple,
                            textColor: Colors.white,
                            onPressed: () async {
                              if (_key.currentState.validate()) {
                                _key.currentState.save();
                                try {
                                  String _token =
                                      await callLogin(email, password);
                                  setAuthStorage(_token);
                                  Navigator.of(context).pushReplacementNamed("/greeting_page");
                                } catch (e) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ModalDialog(
                                        title: "Error",
                                        content: e.toString(),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                          ),
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
