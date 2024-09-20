import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller; // Make controller optional
  final ValueChanged<String>? onChanged; // Make onChanged optional

  const CustomSearchBar({
    this.controller,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.cyan),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.cyan),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.cyan, width: 2.0),
          ),
          labelText: tr('Search'), // Using localization for the label text
          labelStyle: const TextStyle(color: Colors.cyan),
          prefixIcon: const Icon(Icons.search, color: Colors.cyan),
          filled: true,
        ),
        onChanged: onChanged, // Handle text changes if provided
      ),
    );
  }
}
