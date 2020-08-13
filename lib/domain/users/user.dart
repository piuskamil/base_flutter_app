import 'package:flutter/foundation.dart';

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
}
