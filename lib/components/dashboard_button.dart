import 'package:flutter/material.dart';

class DashboardButton extends StatefulWidget {
  Color buttonColor;
  Color textColor;
  String buttonText;

  DashboardButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor
  });

  @override
  State<DashboardButton> createState() => _DashboardButtonState();
}

class _DashboardButtonState extends State<DashboardButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            )
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: widget.textColor,
            fontWeight: FontWeight.bold
          ),
        )
    );
  }
}
