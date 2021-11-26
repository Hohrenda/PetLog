import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      child: DropdownButton<String>(
        value: dropdownValue,
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Type',
            style: GoogleFonts.montserrat(
              color: const Color.fromRGBO(150, 150, 150, 1),
            ),
          ),
        ),
        icon: const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(Icons.keyboard_arrow_down),
        ),
        style: GoogleFonts.montserrat(color: Colors.black, fontSize: 24.0),
        underline: Container(
          height: 1,
          color: Colors.black,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Dog', 'Cat', 'Turtle', 'Pig']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
