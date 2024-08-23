import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
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
