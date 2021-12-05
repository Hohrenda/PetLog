import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  String? selectedValue;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  CustomDropDown({
    Key? key,
    required this.items,
    required this.controller,
    this.selectedValue,
    this.validator,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 14.0, height: 0.8),
        ),
        validator: widget.validator,
        value: widget.selectedValue!.isEmpty ? null : widget.selectedValue,
        isExpanded: true,
        hint: Text(
          'Type',
          style: GoogleFonts.montserrat(
            color: const Color.fromRGBO(150, 150, 150, 1),
            height: 1.0,
          ),
        ),
        icon: Icon(Icons.keyboard_arrow_down),
        style: GoogleFonts.montserrat(color: Colors.black, fontSize: 24.0),
        onChanged: (String? newValue) {
          setState(() {
            widget.controller.text = newValue!;
            widget.selectedValue = newValue;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(height: 1.0),
            ),
          );
        }).toList(),
      ),
    );
  }
}
