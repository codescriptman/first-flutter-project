import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.controller, required this.onSave});
  final controller;
  VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your text here',
          hintStyle: TextStyle(color: Colors.grey[600]),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: onSave,
          child: const Text('OK'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.white,
      elevation: 24.0,
    );
  }
}
