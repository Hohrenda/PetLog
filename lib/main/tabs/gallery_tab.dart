import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:pet_log/main/state/photo_notifier.dart';
import 'package:pet_log/main/widgets/add_photo_button.dart';
import 'package:pet_log/main/widgets/gallery_item.dart';
import 'package:pet_log/popups/delete_element.dart';
import 'package:provider/provider.dart';

class GalleryTab extends StatefulWidget {
  const GalleryTab({Key? key}) : super(key: key);

  @override
  _GalleryTabState createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {
  PhotoNotifier? _photoNotifier;
  List<XFile>? _imageFiles;

  @override
  void initState() {
    super.initState();
    _photoNotifier = Provider.of<PhotoNotifier>(context, listen: false);
    _imageFiles = _photoNotifier!.pickedPhotos;
  }

  @override
  Widget build(BuildContext context) {
    final PetModel? petModel =
        Provider.of<PetNotifier>(context, listen: false).currentPet;
    PetNotifier _petNotifier = Provider.of<PetNotifier>(context, listen: false);

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('pets')
            .doc('${petModel!.id}')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> galleryUrls =
                List.from(snapshot.data!.data()!['galleryUrls']);
            return Padding(
              padding: const EdgeInsets.all(17.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / .7),
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: galleryUrls.length + 1,
                  itemBuilder: (context, index) {
                    if (index != galleryUrls.length) {
                      return GalleryItem(
                        onLongPress: () => {},
                        imageUrl: galleryUrls[index],
                      );
                    } else {
                      return AddPhotoButton(
                        onTap: () async {
                          final temp = await _photoNotifier!.pickMultipleImages();
                          setState(() {
                            _imageFiles = temp;
                          });
                          await _photoNotifier!.uploadMultipleImagesToFirebase(
                            _imageFiles!,
                            petModel.id,
                            petModel.name,
                            () {
                              if (petModel.galleryUrls == null) {
                                petModel.galleryUrls =
                                    List<String>.filled(0, '', growable: true);
                                petModel.galleryUrls
                                    ?.insertAll(0, _photoNotifier!.galleryUrls);
                              } else {
                                petModel.galleryUrls
                                    ?.insertAll(0, _photoNotifier!.galleryUrls);
                              }
                            },
                          );
                          await _petNotifier.updatePet(petModel);
                        },
                      );
                    }
                  }),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
