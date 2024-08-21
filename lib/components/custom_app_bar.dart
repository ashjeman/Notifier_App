import 'package:flutter/material.dart';
import 'package:notifier_app/components/top_right_button.dart';

class CustomAppBar extends StatelessWidget{
  String appBarTitle;

  CustomAppBar({
    super.key,
    required this.appBarTitle
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      title: Text(
        appBarTitle,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
      actions: [
        TopRightButton(
            icon: const Icon(
              Icons.notifications,
              color: Color(0xFF070458),
            ),
            callback: (){}
        ),
        const SizedBox(
          width: 10,
        ),
        TopRightButton(
            icon: const Icon(
              Icons.logout,
              color: Color(0xFF070458),
            ),
            callback: (){}
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
