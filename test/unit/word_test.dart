import 'dart:io';

import 'package:aac/constants.dart';
import 'package:aac/objects/category.dart';
import 'package:aac/objects/word.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');
  TestWidgetsFlutterBinding.ensureInitialized();
  late Box<Word> testBox;
  group('Test Hive box for Words', () {
    setUpAll(() async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getApplicationDocumentsDirectory') {
          return Directory.systemTemp.path; // Provide a mock path for testing
        }
        return null;
      });

      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDir.path);
      Hive.registerAdapter<Word>(WordAdapter());
      Hive.registerAdapter<Category>(CategoryAdapter());
    });

    tearDownAll(() async {
      await Hive.close();
    });

    test('Adding a word', () async {
      Word updated =
          Word(word: 'Updated', imageAsset: imageAsset, categoryId: '');
      testBox = await Hive.openBox<Word>('testBox');
      expect(testBox.isEmpty, true);
      testBox.put('test_key', updated);
      expect(testBox.get('test_key'), updated);
    });

    test('Updating a word', () async {
      Word updated =
          Word(word: 'Updated', imageAsset: imageAsset, categoryId: '');
      testBox = await Hive.openBox<Word>('testBox');
      expect(testBox.isEmpty, false);
      testBox.put('test_key', updated);
      expect(testBox.get('test_key'), updated);
    });

    test('Deleting a word', () async {
      testBox = await Hive.openBox<Word>('testBox');
      testBox.delete('test_key');
      expect(testBox.get('test_key'), null);
      expect(testBox.isEmpty, true);
    });
  });
}
