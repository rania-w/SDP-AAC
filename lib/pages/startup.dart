// ignore_for_file: prefer_const_constructors

import 'package:aac/components/custom_button.dart';
import 'package:aac/constants.dart';
import 'package:aac/objects/user.dart';
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
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text(
            "Kako se zoveš?",
            style: textStyle.copyWith(fontFamily: 'Medium', fontSize: 24),
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
                  decoration: InputDecoration(
                    label: Text('Ime'),
                    labelStyle: TextStyle(color: grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: black, width: 2.0),
                    ),
                    fillColor: white,
                  ),
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                CustomButton(
                    text: "Dalje",
                    func: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/');
                        boxUser.put('user_key', User(nickname: nickname));
                      } else {
                        setState(() {
                          error = 'Unesite ime';
                        });
                      }
                    }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
