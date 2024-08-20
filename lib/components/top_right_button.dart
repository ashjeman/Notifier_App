import 'package:flutter/material.dart';

class TopRightButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback callback;

  const TopRightButton({
    super.key,
    required this.icon,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFC7C0DB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: icon
        ), // Center the icon inside the container
      ),
    );
  }
}