import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 3)
class Word {
  @HiveField(0)
  String word;
  @HiveField(1)
  String imageAsset;

  /// audio file :)

  Word({
    required this.word,
    required this.imageAsset,
  });
}
