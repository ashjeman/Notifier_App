import 'package:flutter/material.dart';

class TextBoldGrey extends StatelessWidget {
  String boldText;

  TextBoldGrey({
    super.key,
    required this.boldText
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      boldText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF616260),
      ),
    );
  }
}
