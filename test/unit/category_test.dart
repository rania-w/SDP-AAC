import 'dart:io';
import 'package:aac/objects/category.dart';
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
    setUpAll(() async {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getApplicationDocumentsDirectory') {
          return Directory.systemTemp.path; // Provide a mock path for testing
        }
        return null;
      });

      // Initialize Hive for testing
      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDir.path);
      Hive.registerAdapter(CategoryAdapter());
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

    test('Deleting a category', () async {
      testBox = await Hive.openBox<Category>('testBox');
      testBox.delete('test_key');
      expect(testBox.get('test_key'), null);
      expect(testBox.isEmpty, true);
    });
  });
}
