import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetEventItem extends StatefulWidget {
  const PetEventItem({Key? key}) : super(key: key);

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
            child: Icon(
              Icons.bathtub,
              size: 50.0,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Center(
                  child: Text('11/05/21'),
                ),
                width: 80.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(61, 224, 146, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
      Text('Bathroom'),
    ]);
  }
}
