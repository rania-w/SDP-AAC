import 'package:aac/objects/word.dart';
import 'package:hive/hive.dart';

part 'sentence.g.dart';

@HiveType(typeId: 4)
class Sentence {
  @HiveField(0)
  String sentence;

  @HiveField(1)
  List<Word>? wordsAssoc;
  List<Word>? get getWordsAssoc => wordsAssoc;

  Sentence({required this.sentence, this.wordsAssoc});
}
