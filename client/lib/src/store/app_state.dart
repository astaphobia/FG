import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool isLoading;
  final String token;
  AppState({
    this.isLoading = false,
    this.token = "",
  });

  factory AppState.initial() => AppState(
        isLoading: false,
        token: "",
      );
}
