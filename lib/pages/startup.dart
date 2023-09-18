import 'package:aac/components/buttons/custom_button.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/user.dart';
import 'package:aac/pages/home.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  final _formKey = GlobalKey<FormState>();

  String nickname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Dobrodošli!', false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Text(
            "Kako se zoveš?",
            style: heading,
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                    validator: (val) => val!.isEmpty ? 'Unesite ime' : null,
                    onChanged: (val) {
                      setState(() => nickname = val);
                    },
                    decoration: textInputDecoration.copyWith(
                        label: const Text('Nadimak'))),
                CustomButton(
                  text: "Dalje",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                      boxUser.put(
                          'user_key',
                          User(
                            nickname: nickname,
                          ));
                      debugPrint(boxUser.values.toString());
                    }
                  },
                  defaultColor: accent,
                  focusColor: accentClicked,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
