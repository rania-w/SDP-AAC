// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:hive/hive.dart';
// import 'package:uuid/uuid.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String nickname;

  @HiveField(1)
  Map colorSettings;

  @HiveField(2)
  Map voiceSettings;

  User(
      {required this.nickname,
      required this.colorSettings,
      required this.voiceSettings});
}
