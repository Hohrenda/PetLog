import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_log/main/widgets/add_photo_button.dart';
import 'package:pet_log/main/widgets/gallery_item.dart';
import 'package:pet_log/popups/delete_element.dart';

class GalleryTab extends StatefulWidget {
  const GalleryTab({Key? key}) : super(key: key);

  @override
  _GalleryTabState createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(17.0),
      childAspectRatio: (1 / .7),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: [
        GalleryItem(
          imageUrl: '',
          onLongPress: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DeleteElement(
                  onDelete: () => {},
                );
              },
            ),
          },
        ),
        AddPhotoButton(
          onTap: () => {},
        ),
      ],
    );
  }
}
