import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pet_log/main/models/document_model.dart';
import 'package:pet_log/main/repository/document_repository.dart';

class DocumentNotifier extends ChangeNotifier {
  final DocumentRepository _documentRepository = DocumentRepository();
  Stream<List<DocumentModel>>? _documentStream;

  Stream<List<DocumentModel>>? get documentStream => _documentStream;

  DocumentModel? currentDocument;

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
}
