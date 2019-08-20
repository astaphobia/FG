///
//  Generated code. Do not modify.
//  source: greeting.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;

import 'dart:core' as $core show int, String, List;

import 'greeting.pb.dart';
export 'greeting.pb.dart';

class GreetingClient extends $grpc.Client {
  static final _$getGreeting =
      $grpc.ClientMethod<GreetingRequest, GreetingResponse>(
          '/api.Greeting/GetGreeting',
          (GreetingRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => GreetingResponse.fromBuffer(value));

  GreetingClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<GreetingResponse> getGreeting(GreetingRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getGreeting, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GreetingServiceBase extends $grpc.Service {
  $core.String get $name => 'api.Greeting';

  GreetingServiceBase() {
    $addMethod($grpc.ServiceMethod<GreetingRequest, GreetingResponse>(
        'GetGreeting',
        getGreeting_Pre,
        false,
        false,
        ($core.List<$core.int> value) => GreetingRequest.fromBuffer(value),
        (GreetingResponse value) => value.writeToBuffer()));
  }

  $async.Future<GreetingResponse> getGreeting_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return getGreeting(call, await request);
  }

  $async.Future<GreetingResponse> getGreeting(
      $grpc.ServiceCall call, GreetingRequest request);
}
