import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'ListTerminalResponse.g.dart';

@JsonSerializable()
class ListTerminalResponse {
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "data")
    List<dynamic>? data;
    @JsonKey(name: "meta")
    Meta? meta;

    ListTerminalResponse({
        this.status,
        this.message,
        this.data,
        this.meta,
    });

    factory ListTerminalResponse.fromJson(Map<String, dynamic> json) => _$ListTerminalResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ListTerminalResponseToJson(this);
}

@JsonSerializable()
class Meta {
    @JsonKey(name: "next")
    dynamic next;
    @JsonKey(name: "previous")
    dynamic previous;
    @JsonKey(name: "perPage")
    int? perPage;

    Meta({
        this.next,
        this.previous,
        this.perPage,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

    Map<String, dynamic> toJson() => _$MetaToJson(this);
}
