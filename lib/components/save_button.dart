import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  String buttonIcon;
  String buttonText;

  SaveButton({
    super.key,
    required this.buttonIcon,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xFFD3E5FF),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 3)

            )
          ]
      ),
      child: Row(
        children: [
          Image.asset(buttonIcon, height: 20, width: 20,),
          const SizedBox(width: 10),
          Text(
            buttonText,
            style: const TextStyle(
              color: Color(0xFF2B5EA8),
              fontWeight: FontWeight.bold
            ),
          )

        ],
      ),
    );
  }
}
