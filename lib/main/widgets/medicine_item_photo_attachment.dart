import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineItemPhotoAttachment extends StatelessWidget {
  final VoidCallback onDelete;
  final String imageUrl;

  const MedicineItemPhotoAttachment({
    Key? key,
    required this.onDelete,
    required this.imageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          fit: BoxFit.fill,
          child: Image.network(
            imageUrl,
            width: 320.0,
            height: 320.0,
            cacheHeight: 320,
            cacheWidth: 320,
          ),
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.restore_from_trash_outlined),
          iconSize: 40.0,
        ),
      ],
    );
  }
}
