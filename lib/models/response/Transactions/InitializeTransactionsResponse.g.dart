// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InitializeTransactionsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitializeTransactionsResponse _$InitializeTransactionsResponseFromJson(
        Map<String, dynamic> json) =>
    InitializeTransactionsResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InitializeTransactionsResponseToJson(
        InitializeTransactionsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      authorizationUrl: json['authorization_url'] as String?,
      accessCode: json['access_code'] as String?,
      reference: json['reference'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'authorization_url': instance.authorizationUrl,
      'access_code': instance.accessCode,
      'reference': instance.reference,
    };
