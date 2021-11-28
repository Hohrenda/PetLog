import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_log/main/models/pet_model.dart';

void main() {
  group('PetModel', () {
    const id = 'id';

    final petModelInstance = PetModel(
        id: id,
        ownerId: 'ownerId',
        name: 'name',
        type: 'type',
        date: Timestamp.fromDate(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day)),
        gender: 'gender',
        imageUrl: 'imageUrl',
        breed: 'breed',
        color: 'color',
        comments: 'comments');

    test('.fromJson creates an instance from a json map', () {
      final json = {
        'id': id,
        'ownerId': 'ownerId',
        'name': 'name',
        'imageUrl': 'imageUrl',
        'type': 'type',
        'date': Timestamp.fromDate(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day)),
        'gender': 'gender',
        'breed': 'breed',
        'color': 'color',
        'comments': 'comments',
      };

      final actualPetModelInstance = PetModel.fromJson(json, id);

      expect(petModelInstance.toString(),
          equals(actualPetModelInstance.toString()));
    });

    test('.toJson converts an instance to map', () {
      final actualJson = petModelInstance.toJson();
      final expectedJson = {
        'ownerId': 'ownerId',
        'name': 'name',
        'imageUrl': 'imageUrl',
        'type': 'type',
        'date': Timestamp.fromDate(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day)),
        'gender': 'gender',
        'breed': 'breed',
        'color': 'color',
        'comments': 'comments',
      };

      expect(actualJson, expectedJson);
    });
  });
}
