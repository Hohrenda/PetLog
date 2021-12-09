import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PhotoNotifier extends ChangeNotifier {
  XFile? pickedFile;
  List<XFile>? pickedPhotos;
  String? imageUrl;
  var galleryUrls = List<String>.filled(0, '', growable: true);

  Future<XFile?> pickImage() async {
    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  Future<List<XFile>?> pickMultipleImages() async {
    pickedPhotos = await ImagePicker().pickMultiImage();
    return pickedPhotos;
  }

  Future<String?> uploadImageToFirebase(XFile imageFile, String? userId,
      String petName, VoidCallback setState) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("${userId}_${petName}_profilePic.jpg");
    UploadTask uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(() => null);
    imageUrl = await ref.getDownloadURL();
    setState();
  }

  Future<String?> uploadMultipleImagesToFirebase(List<XFile> imageFiles,
      String? petId, String petName, VoidCallback setState) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    for (var imageFile in imageFiles) {
      Reference ref = storage
          .ref()
          .child("${petId}_${imageFile.name}_${petName}_galleryPic.jpg");
      UploadTask uploadTask = ref.putFile(File(imageFile.path));
      await uploadTask.whenComplete(() => null);
      galleryUrls.add(await ref.getDownloadURL());
    }
    setState();
    galleryUrls = [];
  }
}
