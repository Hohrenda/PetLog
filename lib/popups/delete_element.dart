import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteElement extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteElement({Key? key, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete element'),
      content: Text('Would you like to delete this element?'),
      actions: [
        TextButton(
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
