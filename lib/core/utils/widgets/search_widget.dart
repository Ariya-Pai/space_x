import 'package:flutter/material.dart';
import 'package:space_x/localization/app_localization.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const SearchWidget({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: localizations.home.search,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
      onChanged: onChanged,
    );
  }
}
