import 'package:aac/objects/word.dart';

class Sentence {
  String sentence;
  List<Word>? wordsAssoc;

  // Sentence(String sentence, List<Word> wordsAssoc) {
  //   this.sentence = sentence;
  //   this.wordsAssoc = wordsAssoc;
  // }

  Sentence({required this.sentence, this.wordsAssoc});
}
