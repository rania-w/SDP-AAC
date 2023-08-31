import 'package:aac/objects/category.dart';
import 'package:aac/objects/sentence.dart';
import 'package:aac/objects/word.dart';
import 'package:hive/hive.dart';
import 'package:aac/services/boxes.dart';
import '../constants.dart';

List<Word> favWords = [];
List<Word> emocijeWords = [
  Word(word: "Sreća", imageAsset: imageAsset, sentences: [
    Sentence(sentence: "Osjećam se sretno."),
    Sentence(sentence: 'Nisam sretan'),
    Sentence(sentence: "Jesi li sretan?")
  ]),
  Word(word: 'Tuga', imageAsset: imageAsset, sentences: [
    Sentence(sentence: 'Tužan sam'),
    Sentence(sentence: 'Jesi li tužan?')
  ]),
  Word(word: 'Ljutnja', imageAsset: imageAsset, sentences: [
    Sentence(sentence: 'Ljut sam'),
    Sentence(sentence: 'Nemoj se ljutiti.')
  ]),
  Word(
      word: "Umor",
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Umorna sam')]),
  Word(
      word: 'Zbunjenost',
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Zbunjena sam.')]),
  Word(
      word: "Mučnina",
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: "Muka mi je.")]),
];

List<Word> konverzacijaWords = [
  Word(
      word: "Ćao",
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')]),
  Word(
      word: 'Ja',
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')]),
  Word(
      word: 'Da',
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')]),
  Word(
      word: 'Ne',
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')]),
  Word(
      word: 'Ti',
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')]),
  Word(
      word: 'Izvini',
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')]),
  Word(
      word: "Ponovi",
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')]),
  Word(
      word: 'Pogledaj',
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')]),
  Word(
      word: 'Upomoć',
      imageAsset: imageAsset,
      sentences: [Sentence(sentence: 'Ćao, kako si?')])
];
// porodica
// moje rijeci prazna lista

// default categories
List<Category> defaultCategories = [
  Category(imageAsset: imageAsset, title: "Favs", words: favWords),
  Category(imageAsset: imageAsset, title: 'Emocije', words: emocijeWords),
  Category(
      imageAsset: imageAsset, title: 'Konverzacija', words: konverzacijaWords)
];

// boxWord.get('key_${}');

// default words per category
// late Box<Category> boxCategory;

void populate() {
  // boxCategory = Hive.box<Category>('boxCategory');
  if (boxCategory.isEmpty) {
    for (var category in defaultCategories) {
      boxCategory.put('key_${category.title}', category);
    }
  }
}
