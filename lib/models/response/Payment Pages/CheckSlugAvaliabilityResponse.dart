import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'CheckSlugAvaliabilityResponse.g.dart';

@JsonSerializable()
class CheckSlugAvaliabilityResponse {
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "message")
    String? message;

    CheckSlugAvaliabilityResponse({
        this.status,
        this.message,
    });

    factory CheckSlugAvaliabilityResponse.fromJson(Map<String, dynamic> json) => _$CheckSlugAvaliabilityResponseFromJson(json);

    Map<String, dynamic> toJson() => _$CheckSlugAvaliabilityResponseToJson(this);
}
