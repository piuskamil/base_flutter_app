import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_element.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class ListElement {
  final String uid;

  ListElement({
    @required this.uid,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => _$ListElementFromJson(json);
  Map<String, dynamic> toJson() => _$ListElementToJson(this);
}