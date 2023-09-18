// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:aac/objects/user.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');
  TestWidgetsFlutterBinding.ensureInitialized();
  late Box<User> testBox;
  group('Test on User box', () {
    setUpAll(() async {
      // Mock path_provider for testing
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
      Hive.registerAdapter(UserAdapter());
    });

    tearDownAll(() async {
      // Close Hive after tests are done
      await Hive.close();
    });
    test('Should set user nickname', () async {
      String nickname = 'test nickname';
      final user = User(nickname: nickname);
      testBox = await Hive.openBox<User>('testBox');
      testBox.put('test_key', user);
      expect(user.nickname, nickname);
      expect(testBox.get('test_key'), user);
    });
  });
}
