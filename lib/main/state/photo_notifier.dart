import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PhotoNotifier extends ChangeNotifier {
  XFile? pickedFile;
  String? imageUrl;

  Future<XFile?> pickImage() async {
    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  Future<String?> uploadImageToFirebase(XFile imageFile, String? userId,
      String petName, VoidCallback setState) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("${userId}_${petName}_profilePic.jpg");
    UploadTask uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(() => null);
    imageUrl = await ref.getDownloadURL();
    print(imageUrl);
    setState();
  }
}
