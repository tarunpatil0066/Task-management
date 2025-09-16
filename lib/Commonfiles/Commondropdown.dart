import 'package:flutter/material.dart';

class CommonDropdown extends StatelessWidget {
  final String? value; // currently selected value
  final List<String> items; // dropdown items
  final ValueChanged<String?> onChanged; // callback when selection changes
  final FormFieldValidator<String>? validator; // validator for form
  final String hintText;

  const CommonDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.validator,
    this.value,
    this.hintText = "Select",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
