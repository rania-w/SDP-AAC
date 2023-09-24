import 'dart:io';
import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');
  TestWidgetsFlutterBinding.ensureInitialized();
  late Box<Category> testBox;

  group('Test Hive box for categories', () {
    /// Hive uses path_provider and needs a mock path for the testing environment
    setUpAll(() async {
      // ignore: deprecated_member_use
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getApplicationDocumentsDirectory') {
          return Directory.systemTemp.path;
        }
        return null;
      });

      /// Initialize Hive for testing
      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDir.path);
      Hive.registerAdapter(CategoryAdapter());
      Hive.registerAdapter(WordAdapter());
    });

    tearDownAll(() async {
      await Hive.close();
    });

    test('Adding a category', () async {
      Category init =
          Category(imageAsset: '', title: 'First category', words: []);
      testBox = await Hive.openBox<Category>('testBox');
      expect(testBox.isEmpty, true);
      testBox.put('test_key', init);
      expect(testBox.get('test_key'), init);
    });

    test('Updating a category', () async {
      Category updated =
          Category(imageAsset: '', title: 'Updated category', words: []);
      testBox = await Hive.openBox<Category>('testBox');
      expect(testBox.isEmpty, false);
      testBox.put('test_key', updated);
      expect(testBox.get('test_key'), updated);
    });

    test('Set and retrieve words of category', () async {
      testBox = await Hive.openBox<Category>('testBox');
      Category? category = testBox.get('test_key');
      expect([], category?.getWords);
      List<Word> list = [
        Word(
            word: 'Word 1',
            imageAsset: imageAsset,
            categoryId: category!.categoryId),
        Word(
            word: 'Word 2',
            imageAsset: imageAsset,
            categoryId: category.categoryId)
      ];
      category.setWords = list;
      testBox.put('test_key', category);
      expect(list, testBox.get('test_key')!.getWords);
    });

    test('Deleting a category', () async {
      testBox = await Hive.openBox<Category>('testBox');
      testBox.delete('test_key');
      expect(testBox.get('test_key'), null);
      expect(testBox.isEmpty, true);
    });
  });
}
