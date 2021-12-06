import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryItem extends StatelessWidget {
  final GestureLongPressCallback? onLongPress;
  final String? imageUrl;

  const GalleryItem(
      {Key? key, required this.onLongPress, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network(
          imageUrl!,
        ),
      ),
    );
  }
}
