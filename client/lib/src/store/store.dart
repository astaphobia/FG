import 'package:client/src/store/app_state.dart';
import 'package:client/src/store/reducers/reducers.dart';
import 'package:client/src/store/middlewares/auth_middleware.dart';
import 'package:redux/redux.dart';

final Store<AppState> store = Store<AppState>(
  reducers,
  initialState: AppState.initial(),
  middleware: [
    authMiddleware,
  ].toList()
);