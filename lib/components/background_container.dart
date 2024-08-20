import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final double boxHeight;
  final Widget bgChild;

  const BackgroundContainer({
    super.key,
    required this.boxHeight,
    required this.bgChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: boxHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: bgChild,

    );
  }
}
