import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_log/main/models/event_model.dart';
import 'package:pet_log/main/state/event_notifier.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:pet_log/main/widgets/custom_add_button.dart';
import 'package:pet_log/main/widgets/event_item.dart';
import 'package:pet_log/popups/add_event.dart';
import 'package:pet_log/popups/delete_element.dart';
import 'package:provider/provider.dart';

class EventTab extends StatefulWidget {
  const EventTab({Key? key}) : super(key: key);

  @override
  _EventTabState createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  EventNotifier? _eventNotifier;
  PetNotifier? _petNotifier;
  Stream<List<EventModel>>? eventsStream;

  @override
  void initState() {
    print('Init state');
    super.initState();
    _eventNotifier = Provider.of<EventNotifier>(context, listen: false);
    _petNotifier = Provider.of<PetNotifier>(context, listen: false);

    _eventNotifier!.loadInitialData(_petNotifier!.currentPet!.id!).whenComplete(
          () => setState(
            () {
              eventsStream = _eventNotifier!.eventStream;
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        StreamBuilder<List<EventModel>>(
          stream: eventsStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return EventItem(
                      eventModel: snapshot.data![index],
                      onLongPress: () => {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DeleteElement(
                              onDelete: () => _eventNotifier!
                                  .deleteEvent(snapshot.data![index]),
                            );
                          },
                        ),
                      },
                      onEditPress: ()=>{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddEvent(
                              isEdit: true,
                              eventModel: snapshot.data![index],
                            );
                          },
                        ),
                      },
                    );
                  });
            }
            return const Text('');
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 23.0, left: 23.0),
          child: CustomAddButton(
            onTap: () => {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddEvent(
                    isEdit: false,
                  );
                },
              ),
            },
            fontSize: 24,
            buttonText: 'Add new event',
          ),
        )
      ],
    );
  }
}
