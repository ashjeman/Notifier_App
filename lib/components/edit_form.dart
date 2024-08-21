import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  String formName;
  String textFieldHint;

  EditForm({
    super.key,
    required this.formName,
    required this.textFieldHint
  });

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              widget.formName,
              style: const TextStyle(
                  color: Color(0xFF2B5EA8),
                  fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
                hintText: widget.textFieldHint,
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(width: 1)
                )
            ),
          )
        ],
      ),
    );
  }
}
