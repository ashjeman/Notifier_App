import 'package:flutter/material.dart';

class TextGrey extends StatelessWidget {

  String textDetails;
  TextGrey({
    super.key,
    required this.textDetails
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textDetails,
      style: const TextStyle(
          color: Color(0xFF616260),
          fontSize: 13
      ),
    );
  }
}
