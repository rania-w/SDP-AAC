import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'word.g.dart';

@HiveType(typeId: 3)
class Word {
  @HiveField(0)
  String word;
  String get getWord => word;

  @HiveField(1)
  String imageAsset;

  @HiveField(2)
  List<String>? sentences;
  set setSentences(List<String> sentences) => this.sentences = sentences;

  @HiveField(3)
  String wordId;

  @HiveField(4)
  String categoryId;

  Word(
      {required this.word,
      required this.imageAsset,
      this.sentences = const [],
      required this.categoryId})
      : wordId = const Uuid().v4();
}
