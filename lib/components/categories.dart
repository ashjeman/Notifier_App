import 'package:flutter/material.dart';

class Categories extends StatelessWidget {

  final String categoryIcon;
  final String categoryName;

  const Categories({
    super.key,
    required this.categoryIcon,
    required this.categoryName
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          height: 56,
          width: 56,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF070458),
              width: 1.5, // Optional: Specify the border width
            ),
            borderRadius: BorderRadius.circular(30.0), // Optional: Add rounded corners
          ),
          child: Image.asset(
            categoryIcon,
          ),
        ),
        SizedBox(
          width: 60,
          child: Text(
            categoryName,
            style: const TextStyle(
                fontSize: 12
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
