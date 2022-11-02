///
//  Generated code. Do not modify.
//  source: token.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name, no_leading_underscores_for_local_identifiers
// coverage:ignore-file

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Payload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Payload',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'payload'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accessTokenHashValue',
        protoName: 'accessTokenHashValue')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audience')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authorizedParty',
        protoName: 'authorizedParty')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'email')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'emailVerified',
        protoName: 'emailVerified')
    ..aInt64(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expirationTime',
        protoName: 'expirationTime')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hostedDomain',
        protoName: 'hostedDomain')
    ..aInt64(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'issuedAt',
        protoName: 'issuedAt')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'issuer')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nonce')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subject')
    ..hasRequiredFields = false;

  Payload._() : super();
  factory Payload({
    $core.String? accessTokenHashValue,
    $core.String? audience,
    $core.String? authorizedParty,
    $core.String? email,
    $core.bool? emailVerified,
    $fixnum.Int64? expirationTime,
    $core.String? hostedDomain,
    $fixnum.Int64? issuedAt,
    $core.String? issuer,
    $core.String? nonce,
    $core.String? subject,
  }) {
    final _result = create();
    if (accessTokenHashValue != null) {
      _result.accessTokenHashValue = accessTokenHashValue;
    }
    if (audience != null) {
      _result.audience = audience;
    }
    if (authorizedParty != null) {
      _result.authorizedParty = authorizedParty;
    }
    if (email != null) {
      _result.email = email;
    }
    if (emailVerified != null) {
      _result.emailVerified = emailVerified;
    }
    if (expirationTime != null) {
      _result.expirationTime = expirationTime;
    }
    if (hostedDomain != null) {
      _result.hostedDomain = hostedDomain;
    }
    if (issuedAt != null) {
      _result.issuedAt = issuedAt;
    }
    if (issuer != null) {
      _result.issuer = issuer;
    }
    if (nonce != null) {
      _result.nonce = nonce;
    }
    if (subject != null) {
      _result.subject = subject;
    }
    return _result;
  }
  factory Payload.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Payload.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Payload clone() => Payload()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Payload copyWith(void Function(Payload) updates) =>
      super.copyWith((message) => updates(message as Payload))
          as Payload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Payload create() => Payload._();
  Payload createEmptyInstance() => create();
  static $pb.PbList<Payload> createRepeated() => $pb.PbList<Payload>();
  @$core.pragma('dart2js:noInline')
  static Payload getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payload>(create);
  static Payload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessTokenHashValue => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessTokenHashValue($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAccessTokenHashValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessTokenHashValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get audience => $_getSZ(1);
  @$pb.TagNumber(2)
  set audience($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAudience() => $_has(1);
  @$pb.TagNumber(2)
  void clearAudience() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authorizedParty => $_getSZ(2);
  @$pb.TagNumber(3)
  set authorizedParty($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAuthorizedParty() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthorizedParty() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get emailVerified => $_getBF(4);
  @$pb.TagNumber(5)
  set emailVerified($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEmailVerified() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmailVerified() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get expirationTime => $_getI64(5);
  @$pb.TagNumber(6)
  set expirationTime($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasExpirationTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpirationTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get hostedDomain => $_getSZ(6);
  @$pb.TagNumber(7)
  set hostedDomain($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHostedDomain() => $_has(6);
  @$pb.TagNumber(7)
  void clearHostedDomain() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get issuedAt => $_getI64(7);
  @$pb.TagNumber(8)
  set issuedAt($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIssuedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearIssuedAt() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get issuer => $_getSZ(8);
  @$pb.TagNumber(9)
  set issuer($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIssuer() => $_has(8);
  @$pb.TagNumber(9)
  void clearIssuer() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get nonce => $_getSZ(9);
  @$pb.TagNumber(10)
  set nonce($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasNonce() => $_has(9);
  @$pb.TagNumber(10)
  void clearNonce() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get subject => $_getSZ(10);
  @$pb.TagNumber(11)
  set subject($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSubject() => $_has(10);
  @$pb.TagNumber(11)
  void clearSubject() => clearField(11);
}

class Token extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Token',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'payload'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payload',
        $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signature',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  Token._() : super();
  factory Token({
    $core.List<$core.int>? payload,
    $core.List<$core.int>? signature,
  }) {
    final _result = create();
    if (payload != null) {
      _result.payload = payload;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    return _result;
  }
  factory Token.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Token.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Token clone() => Token()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Token copyWith(void Function(Token) updates) =>
      super.copyWith((message) => updates(message as Token))
          as Token; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Token create() => Token._();
  Token createEmptyInstance() => create();
  static $pb.PbList<Token> createRepeated() => $pb.PbList<Token>();
  @$core.pragma('dart2js:noInline')
  static Token getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Token>(create);
  static Token? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get payload => $_getN(0);
  @$pb.TagNumber(1)
  set payload($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);
}
