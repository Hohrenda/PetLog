import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  String? selectedValue;
  final TextEditingController controller;

  CustomDropDown({
    Key? key,
    required this.items,
    required this.controller,
    this.selectedValue,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      child: DropdownButton<String>(
        value: widget.selectedValue!.isEmpty ? null : widget.selectedValue,
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
            widget.controller.text = newValue!;
            widget.selectedValue = newValue;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
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
