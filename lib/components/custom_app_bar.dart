import 'package:flutter/material.dart';

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
    );
  }
}
