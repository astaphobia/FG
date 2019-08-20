import 'package:redux/redux.dart';

import 'package:client/src/store/actions/auth_action.dart';
import 'package:client/src/store/app_state.dart';
import 'package:client/src/utils/auth.dart';

void authMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  if (action is AuthPendingAction) {
    String token = await getAuthStorage();
    if (token.isEmpty) {
      store.dispatch(AuthFailedAction());
    }
  }
  next(action);
}
