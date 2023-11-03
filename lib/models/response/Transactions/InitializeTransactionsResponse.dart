import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'InitializeTransactionsResponse.g.dart';

@JsonSerializable()
class InitializeTransactionsResponse {
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "data")
    Data? data;

    InitializeTransactionsResponse({
        this.status,
        this.message,
        this.data,
    });

    factory InitializeTransactionsResponse.fromJson(Map<String, dynamic> json) => _$InitializeTransactionsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$InitializeTransactionsResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "authorization_url")
    String? authorizationUrl;
    @JsonKey(name: "access_code")
    String? accessCode;
    @JsonKey(name: "reference")
    String? reference;

    Data({
        this.authorizationUrl,
        this.accessCode,
        this.reference,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}
