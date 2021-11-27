import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/repository/pet_repository.dart';

class PetNotifier extends ChangeNotifier {
  final PetRepository petRepository = PetRepository();
  Stream<List<PetModel>>? _petStream;

  Stream<List<PetModel>>? get petStream => _petStream;

  Future<void> loadInitialData(String userId) async {
    try {
      _petStream = petRepository.getAllPets(userId);
    } catch (error) {
      print(error);
    }
  }

  Future<void> addPet(PetModel petModel) async {
    await petRepository.createPet(petModel);
  }

  Future<void> updatePet(PetModel petModel) async {
    await petRepository.updatePet(petModel);
  }

  Future<void> deletePet(PetModel petModel) async {
    await petRepository.deletePet(petModel);
  }

}