import 'package:flutter/material.dart';

class CommonPopup extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;

  const CommonPopup({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: content,
      actions: actions,
    );
  }
}
