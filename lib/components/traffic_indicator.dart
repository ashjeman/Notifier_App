import 'package:flutter/material.dart';

class TrafficIndicator extends StatelessWidget {
  Color indicatorColor;

  TrafficIndicator({
    super.key,
    required this.indicatorColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          color: indicatorColor,
          borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}
