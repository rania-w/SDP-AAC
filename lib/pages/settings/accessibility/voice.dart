import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/constants.dart';
import 'package:flutter/material.dart';
import 'package:aac/services/tts.dart';

class VoiceSettings extends StatefulWidget {
  const VoiceSettings({super.key});

  @override
  State<VoiceSettings> createState() => _VoiceSettingsState();
}

class _VoiceSettingsState extends State<VoiceSettings> {
  double volume = 1;
  double pitch = 1;
  double rate = 1;

  var languages = tts.getLanguages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      "Jačina zvuka",
                      style: paragraph.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Slider(
                    activeColor: green,
                    inactiveColor: grey.withOpacity(0.2),
                    min: 0.0,
                    max: 1.0,
                    value: volume,
                    onChanged: (value) {
                      setState(() {
                        volume = value;
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                        double.parse((volume).toStringAsFixed(2)).toString(),
                        style: paragraph.copyWith(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      "Visina",
                      style: paragraph.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Slider(
                    activeColor: green,
                    inactiveColor: grey.withOpacity(0.2),
                    min: 0.5,
                    max: 2.0,
                    value: pitch,
                    onChanged: (value) {
                      setState(() {
                        pitch = value;
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                        double.parse((pitch).toStringAsFixed(2)).toString(),
                        style: paragraph.copyWith(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      "Brzina",
                      style: paragraph.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Slider(
                    activeColor: green,
                    inactiveColor: grey.withOpacity(0.2),
                    min: 0.01,
                    max: 1.0,
                    value: rate,
                    onChanged: (value) {
                      setState(() {
                        rate = value;
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                        double.parse((rate).toStringAsFixed(2)).toString(),
                        style: paragraph.copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              defaultColor: primary,
              text: 'Test',
              onPressed: () async {
                await tts.setPitch(pitch);
                await tts.setLanguage('hr-HR');
                await tts.setVolume(volume);
                await tts.setSpeechRate(rate);
                await tts.speak('Ovo je testna izjava');
              },
              focusColor: primaryF,
            ),
            Row(
              children: [
                CustomButton(
                  onPressed: () {
                    //reset to before state
                    ttsConf(rate, volume, pitch, 'hr-HR');
                  },
                  text: 'Nazad',
                  defaultColor: white,
                  focusColor: greenF,
                ),
                CustomButton(
                  onPressed: () {
                    //save changes
                    ttsConf(rate, volume, pitch, 'hr-HR');
                  },
                  text: 'Spasi promjene',
                  defaultColor: green,
                  focusColor: greenF,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
