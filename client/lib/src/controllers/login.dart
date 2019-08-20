import 'package:grpc/grpc.dart';
import 'package:client/src/generated/login.pbgrpc.dart';

Future<LoginResponse> callLogin(String email, String password) async {
  final channel = new ClientChannel("localhost",
      port: 777,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()));

  final stub = LoginClient(channel);
  final LoginRequest request = new LoginRequest();
  request.email = email;
  request.password = password;

  try {
    final response = await stub.postLogin(request);
    await channel.shutdown();
    return response;
  } catch (e) {
    print("Caught error on callLogin: $e");
    await channel.shutdown();
    return null;
  }
}
