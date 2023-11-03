import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'UpdatePlansResponse.g.dart';

@JsonSerializable()
class UpdatePlansResponse {
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "message")
    String? message;

    UpdatePlansResponse({
        this.status,
        this.message,
    });

    factory UpdatePlansResponse.fromJson(Map<String, dynamic> json) => _$UpdatePlansResponseFromJson(json);

    Map<String, dynamic> toJson() => _$UpdatePlansResponseToJson(this);
}
