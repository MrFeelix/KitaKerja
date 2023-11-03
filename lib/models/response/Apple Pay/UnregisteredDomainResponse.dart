import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'UnregisteredDomainResponse.g.dart';

@JsonSerializable()
class UnregisteredDomainResponse {
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "message")
    String? message;

    UnregisteredDomainResponse({
        this.status,
        this.message,
    });

    factory UnregisteredDomainResponse.fromJson(Map<String, dynamic> json) => _$UnregisteredDomainResponseFromJson(json);

    Map<String, dynamic> toJson() => _$UnregisteredDomainResponseToJson(this);
}
