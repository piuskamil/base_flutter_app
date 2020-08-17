import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class User {
  final String uid;
  final String displayName;
  final String email;
  final String phone;
  final String photoUrl;

  User({
    @required this.uid,
    @required this.displayName,
    @required this.email,
    @required this.phone,
    @required this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
