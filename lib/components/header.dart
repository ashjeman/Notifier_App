import 'package:flutter/material.dart';

class ContainerHeader extends StatelessWidget {

  final String headerTitle;

  const ContainerHeader({
    super.key,
    required this.headerTitle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Text(
        headerTitle,
        style: const TextStyle(
          color: Color(0xFF070458),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
