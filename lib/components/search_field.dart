import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {

  TextEditingController controller;
  Function(String) onChanged;

  SearchField({
    super.key,
    required this.controller,
    required this.onChanged
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search here',
          contentPadding: const EdgeInsets.all(5),
          //filled: true,
          //fillColor: const Color(0xFF9DAEC3),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 1)
          )
      ),
    );
  }
}
