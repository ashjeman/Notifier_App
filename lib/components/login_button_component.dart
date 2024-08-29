import 'package:flutter/material.dart';

class LoginButtonComponent extends StatelessWidget {
  String buttonText;

  LoginButtonComponent({
    super.key,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        height: 33,
        width: 101,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                color: Color(0xFF4C3776),
              ),
            )
          ],
        )
    );
  }
}
