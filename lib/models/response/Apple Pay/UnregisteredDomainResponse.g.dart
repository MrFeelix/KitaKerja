// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UnregisteredDomainResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnregisteredDomainResponse _$UnregisteredDomainResponseFromJson(
        Map<String, dynamic> json) =>
    UnregisteredDomainResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UnregisteredDomainResponseToJson(
        UnregisteredDomainResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
