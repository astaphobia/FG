import 'package:redux/redux.dart';

import 'package:client/src/store/actions/auth_action.dart';

final Reducer<String> authReducer = combineReducers([
  TypedReducer<String, AuthLoadedAction>(_authLoaded),
]);

String _authLoaded(String token, AuthLoadedAction action) {
  return action.token;
}
