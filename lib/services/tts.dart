import 'package:flutter_tts/flutter_tts.dart';

FlutterTts tts = FlutterTts();

void ttsConf() async {
  FlutterTts tts = FlutterTts();

  await tts.setSpeechRate(0);
  await tts.setVolume(1.0);
  await tts.setPitch(1);
  await tts.setLanguage('hr-HR');
}

void bos() async {
  await tts.setLanguage('bs-BA');
  await tts.speak(
      "Zovem se Rania i baš mi se spava. Ovo je dug monolog. Kako li zvuči kad mora puno da melje.");
}

void hr() async {
  await tts.setLanguage('hr-HR');
  await tts.speak(
      "Zovem se Rania i baš mi se spava. Ovo je dug monolog. Kako li zvuči kad mora puno da melje.");
}

void mrs() async {
  await tts.setLanguage('hr-HR');
  await tts.speak("Mrš");
}
