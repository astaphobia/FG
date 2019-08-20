import 'dart:async';
import 'package:client/src/generated/greeting.pbgrpc.dart';
import 'package:grpc/grpc.dart';

Future<GreetingResponse> callGetGreeting(String fullName) async {
  final channel = new ClientChannel('localhost',
      port: 777,
      options: const ChannelOptions(
          credentials: const ChannelCredentials.insecure()));
  final stub = new GreetingClient(channel);

  final name = fullName.isEmpty ? 'Unknown' : fullName;

  try {
    final response =
        await stub.getGreeting(new GreetingRequest()..fullName = name);
    await channel.shutdown();
    return response;
  } catch (e) {
    print("Caught error on getGreeting: $e");
    await channel.shutdown();
    return e;
  }
}
