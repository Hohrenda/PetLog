import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_log/main/models/document_model.dart';
import 'package:pet_log/main/repository/document_repository.dart';

class DocumentNotifier extends ChangeNotifier {
  final DocumentRepository _documentRepository = DocumentRepository();
  Stream<List<DocumentModel>>? _documentStream;

  Stream<List<DocumentModel>>? get documentStream => _documentStream;

  DocumentModel? currentDocument;

  List<String> fileUrls = [];

  Future<void> loadInitialData(String petId, String documentType) async {
    try {
      _documentStream =
          await _documentRepository.getAllDocuments(petId, documentType);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> addDocument(DocumentModel documentModel) async {
    await _documentRepository.createDocument(documentModel);
    notifyListeners();
  }

  Future<void> updateDocument(DocumentModel documentModel) async {
    await _documentRepository.updateDocument(documentModel);
    notifyListeners();
  }

  Future<void> deleteDocument(DocumentModel documentModel) async {
    await _documentRepository.deleteDocument(documentModel);
    notifyListeners();
  }

  Future pickFiles(String petId, String docType, VoidCallback setState) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'pdf', 'doc', 'docx']);

    if (result != null) {
      for (var selectedFile in result.files) {
        Reference ref = storage.ref().child(
            "${selectedFile.name}_${petId}_${docType}");
        UploadTask uploadTask = ref.putFile(File(selectedFile.path!));
        await uploadTask.whenComplete(() => null);
        fileUrls.add(await ref.getDownloadURL());
      }
    }
    setState();
    fileUrls = [];
  }
}
