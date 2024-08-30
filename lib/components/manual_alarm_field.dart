import 'package:flutter/material.dart';

class PopupMenuLabel extends StatefulWidget {
  String fieldIconPath;
  String fieldName;

  PopupMenuLabel({
    super.key,
    required this.fieldIconPath,
    required this.fieldName
  });

  @override
  State<PopupMenuLabel> createState() => _PopupMenuLabelState();
}

class _PopupMenuLabelState extends State<PopupMenuLabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ImageIcon(AssetImage(widget.fieldIconPath), color: const Color(0xff224B87)),
            const SizedBox(width: 15),
            Text(
              widget.fieldName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff224B87)
              ),
            )
          ],
        )
    );
  }
}
