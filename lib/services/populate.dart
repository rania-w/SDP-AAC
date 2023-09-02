import 'package:aac/objects/category.dart';
import 'package:aac/objects/sentence.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/services/boxes.dart';
import '../constants.dart';

Category favs = Category(imageAsset: imageAsset, title: "Favs", words: []);
Category emocije =
    Category(imageAsset: imageAsset, title: 'Emocije', words: []);
Category konverzacija =
    Category(imageAsset: imageAsset, title: 'Konverzacija', words: []);

List<Category> defaultCategories = [favs, emocije, konverzacija];

List<Word> favWords = [];
Word sreca = Word(
    word: "Sreća",
    imageAsset: imageAsset,
    sentences: [
      Sentence(sentence: "Osjećam se sretno."),
      Sentence(sentence: 'Nisam sretan'),
      Sentence(sentence: "Jesi li sretan?")
    ],
    categoryId: emocije.categoryId);
Word tuga = Word(
    word: 'Tuga',
    imageAsset: imageAsset,
    sentences: [
      Sentence(sentence: 'Tužan sam'),
      Sentence(sentence: 'Jesi li tužan?')
    ],
    categoryId: emocije.categoryId);
Word ljutnja = Word(
    word: 'Ljutnja',
    imageAsset: imageAsset,
    sentences: [
      Sentence(sentence: 'Ljut sam'),
      Sentence(sentence: 'Nemoj se ljutiti.')
    ],
    categoryId: emocije.categoryId);

Word umor = Word(
    word: "Umor",
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Umorna sam')],
    categoryId: emocije.categoryId);

Word zbunjen = Word(
    word: 'Zbunjenost',
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Zbunjena sam.')],
    categoryId: emocije.categoryId);

Word muka = Word(
    word: "Mučnina",
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: "Muka mi je.")],
    categoryId: emocije.categoryId);
List<Word> emocijeWords = [
  sreca,
  tuga,
  ljutnja,
  umor,
  zbunjen,
];

Word cao = Word(
    word: "Ćao",
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);
Word ja = Word(
    word: 'Ja',
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);
Word ti = Word(
    word: 'Ti',
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);
Word da = Word(
    word: 'Da',
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);
Word ne = Word(
    word: 'Ne',
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);
Word izvini = Word(
    word: 'Izvini',
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);
Word ponovi = Word(
    word: "Ponovi",
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);
Word upomoc = Word(
    word: 'Upomoć',
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);
Word pogledaj = Word(
    word: 'Pogledaj',
    imageAsset: imageAsset,
    sentences: [Sentence(sentence: 'Ćao, kako si?')],
    categoryId: konverzacija.categoryId);

List<Word> konverzacijaWords = [
  cao,
  ja,
  ti,
  da,
  ne,
  upomoc,
  izvini,
  pogledaj,
  ponovi
];

// porodica
// moje rijeci prazna lista

void populate() {
  try {
    emocije.setWords = emocijeWords;
    konverzacija.setWords = konverzacijaWords;
    favs.setWords = favWords;
    if (boxCategory.isEmpty) {
      for (var category in defaultCategories) {
        boxCategory.put(category.categoryId, category);
        for (var word in category.words) {
          boxWord.put(word.wordId, word);
        }
      }
    }
  } catch (e) {
    print("populate exception: " + e.toString());
  }
}
