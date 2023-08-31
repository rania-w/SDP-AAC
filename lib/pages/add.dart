// ignore_for_file: prefer_const_constructors
import 'package:aac/components/form.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  Map data = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments ?? {}) as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffecec),
        iconTheme: IconThemeData(color: Color(0xff393E41)),
        title: const Text(
          "AAC",
          style: TextStyle(fontFamily: 'Medium', color: Color(0xff393E41)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: CustomForm(initialValue: data['word']),
      ),
    );
  }
}
