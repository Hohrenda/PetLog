import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownItem extends StatelessWidget {
  final String textItem;
  final IconData iconItem;
  const DropDownItem({Key? key, required this.textItem, required this.iconItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(
          iconItem,
        ),
        Text(textItem),
      ],
    );
  }
}
