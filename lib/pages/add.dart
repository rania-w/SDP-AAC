// ignore_for_file: prefer_const_constructors
import 'package:aac/components/form.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
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
        child: CustomForm(),
      ),
    );
  }
}
