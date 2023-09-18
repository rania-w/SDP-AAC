import 'package:aac/constants.dart';
import 'package:aac/objects/user.dart';
import 'package:aac/services/boxes.dart';
import 'package:flutter/material.dart';

class CustomInputDialog extends StatefulWidget {
  const CustomInputDialog({super.key});

  @override
  State<CustomInputDialog> createState() => _CustomInputDialogState();
}

class _CustomInputDialogState extends State<CustomInputDialog> {
  User user = boxUser.get("user_key");
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textController.text = user.nickname;
    return AlertDialog(
      title: const Text('Nadimak'),
      titleTextStyle: paragraph.copyWith(fontWeight: FontWeight.bold),
      content: TextFormField(
        controller: _textController,
        decoration: textInputDecoration,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(
            'Nazad',
            style: paragraph.copyWith(fontSize: 12),
          ),
        ),
        TextButton(
          onPressed: () {
            user.nickname = _textController.text;
            boxUser.put('user_key', user);
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(
            'Spasi promjene',
            style: paragraph.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
