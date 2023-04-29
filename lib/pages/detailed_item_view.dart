import 'package:flutter/material.dart';

class DetailedItemView extends StatefulWidget {
  const DetailedItemView({super.key});

  @override
  State<DetailedItemView> createState() => _DetailedItemViewState();
}

class _DetailedItemViewState extends State<DetailedItemView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("DetailedItemView"),
    );
  }
}
