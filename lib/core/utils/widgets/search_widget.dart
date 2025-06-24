import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const SearchWidget({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search by name...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
      onChanged: onChanged,
    );
  }
}
