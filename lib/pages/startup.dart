// ignore_for_file: prefer_const_constructors

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

  String error = '';

  String nickname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Dobrodošli!'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text(
            "Kako se zoveš?",
            style: heading,
          ),
          SizedBox(
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
                    decoration:
                        textInputDecoration.copyWith(label: Text('nickname'))),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                CustomButton(
                  text: "Dalje",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                      boxUser.put(
                          'user_key',
                          User(
                            nickname: nickname,
                          ));
                      debugPrint(boxUser.values.toString());
                    } else {
                      setState(() {
                        error = 'Unesite ime';
                      });
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
