///
//  Generated code. Do not modify.
//  source: greeting.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

class GreetingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GreetingRequest', package: const $pb.PackageName('api'))
    ..aOS(1, 'fullName')
    ..hasRequiredFields = false
  ;

  GreetingRequest() : super();
  GreetingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GreetingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GreetingRequest clone() => GreetingRequest()..mergeFromMessage(this);
  GreetingRequest copyWith(void Function(GreetingRequest) updates) => super.copyWith((message) => updates(message as GreetingRequest));
  $pb.BuilderInfo get info_ => _i;
  static GreetingRequest create() => GreetingRequest();
  GreetingRequest createEmptyInstance() => create();
  static $pb.PbList<GreetingRequest> createRepeated() => $pb.PbList<GreetingRequest>();
  static GreetingRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GreetingRequest _defaultInstance;

  $core.String get fullName => $_getS(0, '');
  set fullName($core.String v) { $_setString(0, v); }
  $core.bool hasFullName() => $_has(0);
  void clearFullName() => clearField(1);
}

class GreetingResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GreetingResponse', package: const $pb.PackageName('api'))
    ..aOS(1, 'greeting')
    ..hasRequiredFields = false
  ;

  GreetingResponse() : super();
  GreetingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GreetingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GreetingResponse clone() => GreetingResponse()..mergeFromMessage(this);
  GreetingResponse copyWith(void Function(GreetingResponse) updates) => super.copyWith((message) => updates(message as GreetingResponse));
  $pb.BuilderInfo get info_ => _i;
  static GreetingResponse create() => GreetingResponse();
  GreetingResponse createEmptyInstance() => create();
  static $pb.PbList<GreetingResponse> createRepeated() => $pb.PbList<GreetingResponse>();
  static GreetingResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GreetingResponse _defaultInstance;

  $core.String get greeting => $_getS(0, '');
  set greeting($core.String v) { $_setString(0, v); }
  $core.bool hasGreeting() => $_has(0);
  void clearGreeting() => clearField(1);
}

