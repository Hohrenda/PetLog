import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_log/main/widgets/custom_add_button.dart';
import 'package:pet_log/main/widgets/event_item.dart';
import 'package:pet_log/popups/add_event.dart';

class EventTab extends StatefulWidget {
  const EventTab({Key? key}) : super(key: key);

  @override
  _EventTabState createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  createAlertDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              children: [
                Text('Add new event'),
                TextField(
                  controller: nameController,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventItem(nameEvent: 'nameEvent', timeEvent: DateTime.utc(1989, 11, 9)),
        CustomAddButton(
          buttonText: 'Add new event',
          fontSize: 30,
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddEvent();
              },
            ),
          },
        ),
      ],
    );
  }
}
