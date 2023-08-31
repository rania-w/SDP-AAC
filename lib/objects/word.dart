import 'package:aac/objects/sentence.dart';
import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 3)
class Word {
  @HiveField(0)
  String word;
  String get getWord => word;

  @HiveField(1)
  String imageAsset;

  @HiveField(2)
  List<Sentence>? sentences;

  /// audio file :)

  Word({required this.word, required this.imageAsset, this.sentences});
}
