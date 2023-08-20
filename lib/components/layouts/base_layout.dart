import 'package:flutter/material.dart';
// import 'package:aac/resources/a_a_c_icons.dart';
import 'package:aac/resources/a_a_c_icons_icons.dart';
class BaseLayout extends StatefulWidget {
  final Widget child;

  const BaseLayout({super.key, required this.child});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int bottomNavBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // da li appbar ima poentu
      appBar: AppBar(
        title: const Text('AAC', style: TextStyle(fontFamily: 'Medium', color: Color(0xff393E41)),),
        backgroundColor: Color(0xffffecec),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Expanded(child: widget.child),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(AACIcons.settings), label: "settings"),
          BottomNavigationBarItem(icon: Icon(AACIcons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(AACIcons.puzzle), label: "build"),
        ],
        currentIndex: bottomNavBarIndex,
        onTap: (index) {
          setState(() {
            bottomNavBarIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFCFC).withOpacity(0.8),
        iconSize: 32,
        // TODO moze bolje ovaj navbar al zasad radi svoje
        selectedItemColor: Color(0xFF393E41),
      ),
    );
  }
}
