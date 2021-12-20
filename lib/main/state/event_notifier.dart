import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:pet_log/main/models/event_model.dart';
import 'package:pet_log/main/repository/event_repository.dart';

class EventNotifier extends ChangeNotifier{
  final EventRepository _eventRepository = EventRepository();
  Stream<List<EventModel>>? _eventStream;

  Stream<List<EventModel>>? get eventStream => _eventStream;

  EventModel? currentEvent;

  Future<void> loadInitialData(String userId) async {
    try {
      _eventStream = await _eventRepository.getAllEvents(userId);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
  Future<void> addEvent(EventModel eventModel) async {
    await _eventRepository.createEvent(eventModel);
    notifyListeners();
  }
  Future<void> updateEvent(EventModel eventModel) async {
    await _eventRepository.updateEvent(eventModel);
    notifyListeners();
  }

  Future<void> deleteEvent(EventModel eventModel) async {
    await _eventRepository.deleteEvent(eventModel);
    notifyListeners();
  }
}