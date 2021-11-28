import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_log/main/models/pet_model.dart';

class PetRepository {
  final _petCollection = 'pets';

  CollectionReference get collectionPath {
    return FirebaseFirestore.instance.collection(_petCollection);
  }

  Future<void> createPet(PetModel petModel) async {
    try {
      await collectionPath.add(petModel.toJson());
    } catch (error) {
      print('Pet creation error - $error');
    }
  }

  Future<void> deletePet(PetModel petModel) async {
    try {
      await collectionPath.doc(petModel.id).delete();
    } catch (error) {
      print('Pet deletion error - $error');
    }
  }

  Future<void> updatePet(PetModel petModel) async {
    try {
      await collectionPath.doc(petModel.id).update(petModel.toJson());
    } catch (error) {
      print('Pet deletion error - $error');
    }
  }

  Future<PetModel?> getPet(String petId) async {
    try {
      final petSnapshot = await collectionPath.doc(petId).get();
      return PetModel.fromDocument(petSnapshot);
    } catch (error) {
      print('Pet deletion error - $error');
    }
  }

  Future<Stream<List<PetModel>>?> getAllPets(String userId) async {
    try {
      return await collectionPath.where('ownerId', isEqualTo: userId).snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => PetModel.fromDocument(doc))
              .toList());
    } catch (error) {
      print('Error while getting pets $error');
    }
  }
}
