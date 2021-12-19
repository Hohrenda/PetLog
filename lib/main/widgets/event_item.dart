import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  final String nameEvent;
  final DateTime timeEvent;

  const EventItem({Key? key, required this.nameEvent, required this.timeEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                nameEvent,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromRGBO(255, 120, 63, 1),
                ),
              ),
              Text(
                DateFormat('yyyy-MM-dd \n hh-mm a').format(timeEvent),
                style: GoogleFonts.montserrat(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromRGBO(255, 120, 63, 1),
                ),
              ),
              const Icon(
                Icons.edit,
                size: 30,
                color: Colors.black,
              )
            ],
          ),
          const Divider(
            thickness: 1.0,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
