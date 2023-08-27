// ignore_for_file: prefer_const_constructors
import 'package:aac/components/custom_button.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

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
              initialValue: "initialvalue",
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text(
                "Name",
                style: TextStyle(
                    fontFamily: 'Light',
                    fontSize: 16,
                    color: Color(0xFF393E41)),
              )),
            ),
            Placeholder(),
            CustomButton(text: "text", func: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(text: "cancel", func: () {}),
                CustomButton(
                    text: "Save",
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
