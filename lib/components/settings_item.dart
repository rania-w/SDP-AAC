import 'package:flutter/material.dart';

class SettingsItem extends StatefulWidget {
  final String name;
  final VoidCallback onPressed;

  const SettingsItem({super.key, required this.name, required this.onPressed});

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF393E41)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.pressed)
                      ? const Color(0xffffffff).withOpacity(0)
                      : const Color(0xffffffff).withOpacity(0)),
              shadowColor: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.pressed)
                      ? const Color(0xff9ead7f).withOpacity(0)
                      : const Color(0xffc1ccac).withOpacity(0))),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.name,
              style: const TextStyle(color: Color(0xff393E41)),
            ),
          ),
        ),
      ),
    );
  }
}
