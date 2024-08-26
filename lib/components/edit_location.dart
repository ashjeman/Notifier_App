import 'package:flutter/material.dart';

class EditLocation extends StatefulWidget {
  const EditLocation({super.key});

  @override
  State<EditLocation> createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Location'),
      content: TextField(
        decoration: InputDecoration(
          hintText: "New location name"
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save')
        )
      ],
    );
  }
}
