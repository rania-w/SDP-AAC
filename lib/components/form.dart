// ignore_for_file: prefer_const_constructors
import 'package:aac/components/custom_button.dart';
import 'package:aac/constants.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final String initialValue;
  const CustomForm({super.key, required this.initialValue});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.initialValue,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Polje ne može biti prazno';
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text("Name",
                      style: textStyle.copyWith(
                          fontFamily: 'Light', fontSize: 16))),
            ),
            Placeholder(),
            CustomButton(text: "Spasi promjene", func: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    text: "Nazad",
                    func: () {
                      Navigator.pop(context);
                    }),
                CustomButton(
                    text: "Spasi promjene",
                    func: () {
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                    }),
              ],
            )
          ],
        ));
  }
}
