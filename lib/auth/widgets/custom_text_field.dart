import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final bool? obscureText;
  final String labelText;
  final TextEditingController controller;

  const CustomTextField(
      {Key? key, required this.labelText, required this.controller, this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 314.0,
      height: 40.0,
      child: TextField(
        obscureText: obscureText ?? false,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: labelText,
          hintStyle: GoogleFonts.montserrat(
              color: const Color.fromRGBO(150, 150, 150, 1),
              fontWeight: FontWeight.normal,
              fontSize: 24.0),
        ),
      ),
    );
  }
}
