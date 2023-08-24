import 'word.dart';

class Category {
  // Image image;
  String title;
  String imageAsset;
  List<Word> words;
  Category({required this.imageAsset, required this.title, required this.words});
}
