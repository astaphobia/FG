import 'package:client/src/store/reducers/auth_reducer.dart';
import 'package:client/src/store/app_state.dart';

AppState reducers(AppState state, action) => AppState(
      token: authReducer(state.token, action),
    );
