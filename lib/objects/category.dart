import 'package:uuid/uuid.dart';

import 'word.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 2)
class Category {
  // Image image;
  @HiveField(0)
  String title;
  @HiveField(1)
  String imageAsset;
  @HiveField(2)
  List<Word> words;
  List<Word> get getWords => words;
  set setWords(List<Word> words) => this.words = words;
  @HiveField(3)
  String categoryId;
  Category({required this.imageAsset, required this.title, required this.words})
      : categoryId = Uuid().v4();
}
