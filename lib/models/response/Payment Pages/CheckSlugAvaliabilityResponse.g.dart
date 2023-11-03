// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckSlugAvaliabilityResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckSlugAvaliabilityResponse _$CheckSlugAvaliabilityResponseFromJson(
        Map<String, dynamic> json) =>
    CheckSlugAvaliabilityResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CheckSlugAvaliabilityResponseToJson(
        CheckSlugAvaliabilityResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
