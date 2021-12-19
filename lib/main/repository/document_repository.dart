import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_log/main/models/document_model.dart';

class DocumentRepository {
  final _documentCollection = 'docs';

  CollectionReference get collectionPath {
    return FirebaseFirestore.instance.collection(_documentCollection);
  }

  Future<void> createDocument(DocumentModel documentModel) async {
    try {
      await collectionPath.add(documentModel.toJson());
    } catch (error) {
      print('Document creation error - $error');
    }
  }

  Future<void> deleteDocument(DocumentModel documentModel) async {
    try {
      await collectionPath.doc(documentModel.id).delete();
    } catch (error) {
      print('Document deletion error - $error');
    }
  }

  Future<void> updateDocument(DocumentModel documentModel) async {
    try {
      await collectionPath.doc(documentModel.id).update(documentModel.toJson());
    } catch (error) {
      print('Document deletion error - $error');
    }
  }

  Future<DocumentModel?> getDocument(String documentId) async {
    try {
      final documentSnapshot = await collectionPath.doc(documentId).get();
      return DocumentModel.fromDocument(documentSnapshot);
    } catch (error) {
      print('Document deletion error - $error');
    }
  }

  Stream<List<DocumentModel>>? getAllDocuments(
      String petId, String documentType) {
    try {
      return collectionPath
          .where('documentType', isEqualTo: documentType)
          .where('petId', isEqualTo: petId)
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((doc) => DocumentModel.fromDocument(doc))
              .toList());
    } catch (error) {
      print('Error while getting documents $error');
    }
  }
}
