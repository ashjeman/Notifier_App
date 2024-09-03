import 'package:flutter/material.dart';

class TaskDetailsButton extends StatelessWidget {
  final String icon;
  final VoidCallback callback;

  const TaskDetailsButton({
    super.key,
    required this.icon,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFBBC7E5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: ImageIcon(AssetImage(icon), color: const Color(0xFF183C70),)
        ), // Center the icon inside the container
      ),
    );
  }
}