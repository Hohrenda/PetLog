import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pet_log/main/models/event_model.dart';

class EventItem extends StatelessWidget {
  EventModel eventModel;
  final GestureLongPressCallback onLongPress;
  final VoidCallback onEditPress;

  EventItem({Key? key, required this.eventModel, required this.onLongPress, required this.onEditPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.only(top: 26.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  eventModel.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromRGBO(255, 120, 63, 1),
                  ),
                ),
                Text(
                  DateFormat('yyyy-MM-dd \n hh-mm a').format(eventModel.date.toDate()),
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromRGBO(255, 120, 63, 1),
                  ),
                ),
                InkWell(
                  onTap: onEditPress,
                  child: const Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 1.0,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
