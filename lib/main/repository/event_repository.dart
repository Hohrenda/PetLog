import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_log/main/models/event_model.dart';

class EventRepository {
  final _documentCollection = 'events';

  CollectionReference get collectionPath {
    return FirebaseFirestore.instance.collection(_documentCollection);
  }

  Future<void> createEvent(EventModel eventModel) async {
    try {
      await collectionPath.add(eventModel.toJson());
    } catch (error) {
      print('Event creation error - $error');
    }
  }

  Future<void> deleteEvent(EventModel eventModel) async {
    try {
      await collectionPath.doc(eventModel.id).delete();
    } catch (error) {
      print('Document deletion error - $error');
    }
  }

  Future<void> updateEvent(EventModel eventModel) async {
    try {
      await collectionPath.doc(eventModel.id).update(eventModel.toJson());
    } catch (error) {
      print('Document deletion error - $error');
    }
  }

  Future<EventModel?> getEvent(String documentId) async {
    try {
      final documentSnapshot = await collectionPath.doc(documentId).get();
      return EventModel.fromDocument(documentSnapshot);
    } catch (error) {
      print('Document deletion error - $error');
    }
  }

  Stream<List<EventModel>>? getAllEvents(String petId) {
    try {
      return collectionPath.where('petId', isEqualTo: petId).snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => EventModel.fromDocument(doc))
              .toList());
    } catch (error) {
      print('Error while getting documents $error');
    }
  }
}
