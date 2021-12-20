import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pet_log/main/models/event_model.dart';

class PetEventItem extends StatefulWidget {
  EventModel? eventModel;

  PetEventItem({Key? key, this.eventModel}) : super(key: key);

  @override
  _PetEventItemState createState() => _PetEventItemState();
}

class _PetEventItemState extends State<PetEventItem> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 10.0, color: Colors.orange)),
            child: Container(
              width: 20.0,
              height: 20.0,
              child: SvgPicture.asset(
                widget.eventModel!.svgIcon,
                width: 10.0,
                height: 10.0,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Center(
                  child: Text(
                      DateFormat('yyyy/MM/dd').format(widget.eventModel!.date.toDate()),
                  ),
                ),
                width: 80.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(61, 224, 146, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
      Text(widget.eventModel!.name),
    ]);
  }
}
