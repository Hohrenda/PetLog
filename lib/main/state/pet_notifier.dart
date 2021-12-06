import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/repository/pet_repository.dart';

class PetNotifier extends ChangeNotifier {
  final PetRepository _petRepository = PetRepository();
  Stream<List<PetModel>>? _petStream;

  Stream<List<PetModel>>? get petStream => _petStream;

  PetModel? currentPet;

  Future<void> loadInitialData(String userId) async {
    try {
      _petStream = await _petRepository.getAllPets(userId);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> addPet(PetModel petModel) async {
    await _petRepository.createPet(petModel);
    notifyListeners();
  }

  Future<void> updatePet(PetModel petModel) async {
    await _petRepository.updatePet(petModel);
    notifyListeners();
  }

  Future<void> deletePet(PetModel petModel) async {
    await _petRepository.deletePet(petModel);
    notifyListeners();
  }

}