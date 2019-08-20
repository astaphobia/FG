import 'package:shared_preferences/shared_preferences.dart';

Future<String> getAuthStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _token = prefs.get('auth_token');
  return _token;
}

Future<void> setAuthStorage(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("auth_token", token);
}

Future<void> removeAuthStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.remove("auth_token");
}
