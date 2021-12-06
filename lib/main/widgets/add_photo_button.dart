import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPhotoButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddPhotoButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Color.fromRGBO(196, 196, 196, 1),
        child: Center(
          child: Icon(
            Icons.add,
            size: 56.0,
            color: Color.fromRGBO(132, 131, 131, 1),
          ),
        ),
      ),
    );
  }
}
