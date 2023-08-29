// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  User({required this.nickname});

  @HiveField(0)
  String nickname;
}
