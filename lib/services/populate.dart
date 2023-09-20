import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:aac/services/boxes.dart';
import 'package:aac/constants.dart';
import 'package:flutter/material.dart';

Category emocije =
    Category(imageAsset: images['advice']!, title: 'Emocije', words: []);

Category konverzacija =
    Category(imageAsset: images['talk']!, title: 'Konverzacija', words: []);

Category hrana =
    Category(imageAsset: images['doughnut']!, title: 'Hrana', words: []);

Category porodica =
    Category(imageAsset: images['family']!, title: 'Porodica', words: []);

List<Category> defaultCategories = [
  emocije,
  konverzacija,
  hrana,
  porodica,
];

Word sreca = Word(
    word: "Sreća",
    imageAsset: images['happy']!,
    sentences: [
      "Osjećam se sretno.",
      'Nisam sretan',
      "Jesi li sretan?",
    ],
    categoryId: emocije.categoryId);
Word tuga = Word(
    word: 'Tuga',
    imageAsset: images['sad']!,
    sentences: ['Tužan sam', 'Jesi li tužan?'],
    categoryId: emocije.categoryId);
Word ljutnja = Word(
    word: 'Ljutnja',
    imageAsset: images['angry']!,
    sentences: ['Ljut sam', 'Nemoj se ljutiti.'],
    categoryId: emocije.categoryId);

Word umor = Word(
    word: "Umor",
    imageAsset: images['tired']!,
    sentences: ['Umorna sam'],
    categoryId: emocije.categoryId);

Word zbunjen = Word(
    word: 'Zbunjenost',
    imageAsset: images['confused']!,
    sentences: ['Zbunjena sam.'],
    categoryId: emocije.categoryId);

Word muka = Word(
    word: "Mučnina",
    imageAsset: images['sick']!,
    sentences: ["Muka mi je."],
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
    sentences: ['Ćao, kako si?'],
    categoryId: konverzacija.categoryId);
Word ja = Word(
    word: 'Ja',
    imageAsset: imageAsset,
    sentences: [],
    categoryId: konverzacija.categoryId);
Word ti = Word(
    word: 'Ti',
    imageAsset: imageAsset,
    sentences: ['Kako se zoveš?'],
    categoryId: konverzacija.categoryId);
Word da = Word(
    word: 'Da',
    imageAsset: images['yes']!,
    sentences: ['Može.', 'Želim.'],
    categoryId: konverzacija.categoryId);
Word ne = Word(
    word: 'Ne',
    imageAsset: images['no']!,
    sentences: ['Ne može.', 'Ne želim.'],
    categoryId: konverzacija.categoryId);
Word izvini = Word(
    word: 'Izvini',
    imageAsset: images['sorry']!,
    sentences: ['Žao mi je'],
    categoryId: konverzacija.categoryId);
Word ponovi = Word(
    word: "Ponovi",
    imageAsset: images['listening']!,
    sentences: ['Možeš li ponoviti?'],
    categoryId: konverzacija.categoryId);
Word upomoc = Word(
    word: 'Upomoć',
    imageAsset: images['help']!,
    sentences: ['Možeš li mi pomoći?'],
    categoryId: konverzacija.categoryId);
Word pogledaj = Word(
    word: 'Pogledaj',
    imageAsset: images['eye']!,
    sentences: ['Pogledaj ovo!'],
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

Word jabuka = Word(
    word: 'Jabuka',
    imageAsset: images['apple']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim jabuku.' 'Volim jabuke.']);
Word sendvic = Word(
    word: 'Sendvič',
    imageAsset: images['sandwich']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim sendvič.' 'Volim sendviče.']);
Word hljeb = Word(
    word: 'Hljeb',
    imageAsset: images['bread']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim hljeba.']);
Word mlijeko = Word(
    word: 'Mlijeko',
    imageAsset: images['milk']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim mlijeko.' 'Volim mlijeko.']);
Word secer = Word(
    word: 'Šećer',
    imageAsset: images['sugar']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim šećera.']);
Word so = Word(
    word: 'Sol',
    imageAsset: images['salt']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim soli.']);
Word meso = Word(
    word: 'Meso',
    imageAsset: images['meat']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim meso.' 'Volim meso.']);
Word sir = Word(
    word: 'Sir',
    imageAsset: images['cheese']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim sir.' 'Volim sir.']);
Word krompir = Word(
    word: 'Krompir',
    imageAsset: images['potato']!,
    categoryId: hrana.categoryId,
    sentences: ['Želim krompir.' 'Volim krompir.']);

List<Word> hranaWords = [
  jabuka,
  sendvic,
  mlijeko,
  hljeb,
  secer,
  so,
  meso,
  sir,
  krompir
];

Word mama = Word(
    word: 'Mama',
    imageAsset: images['mom']!,
    categoryId: porodica.categoryId,
    sentences: ['Ovo je moja mama.', 'Volim svoju mamu.']);
Word tata = Word(
    word: 'Tata',
    imageAsset: images['dad']!,
    categoryId: porodica.categoryId,
    sentences: ['Ovo je moj tata.', 'Volim svog tatu.']);
Word brat = Word(
    word: 'Brat',
    imageAsset: images['boy']!,
    categoryId: porodica.categoryId,
    sentences: ['Ovo je moj brat.', 'Volim svog brata.']);
Word sestra = Word(
    word: 'Sestra',
    imageAsset: images['girl']!,
    categoryId: porodica.categoryId,
    sentences: ['Ovo je moja sestra.', 'Volim svoju sestru.']);
List<Word> porodicaWords = [mama, tata, brat, sestra];

void populate() {
  try {
    emocije.setWords = emocijeWords;
    konverzacija.setWords = konverzacijaWords;
    hrana.setWords = hranaWords;
    porodica.setWords = porodicaWords;
    if (boxCategory.isEmpty) {
      for (var category in defaultCategories) {
        boxCategory.put(category.categoryId, category);
        for (var word in category.words) {
          boxWord.put(word.wordId, word);
        }
      }
    }
  } catch (e) {
    debugPrint("populate exception: $e");
  }
}
