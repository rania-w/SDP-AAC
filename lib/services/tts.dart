import 'package:flutter_tts/flutter_tts.dart';

FlutterTts tts = FlutterTts();
Map ttsSettings = {};

void ttsConf(
    double speechRate, double volume, double pitch, String language) async {
  await tts.setSpeechRate(speechRate);
  await tts.setVolume(volume);
  await tts.setPitch(pitch);
  await tts.setLanguage(language);

  ttsSettings = {
    'speechRate': speechRate,
    'volume': volume,
    'pitch': pitch,
    'language': language
  };
}
