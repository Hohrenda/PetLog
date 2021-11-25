import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final bool? obscureText;
  final String labelText;
  final TextEditingController controller;
  final double width;
  final double height;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText,
    this.width = 314.0,
    this.height = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextField(
        obscureText: obscureText ?? false,
        controller: controller,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.normal,
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          contentPadding: const EdgeInsets.only(bottom: 3.0),
          hintText: labelText,
          hintStyle: GoogleFonts.montserrat(
            color: const Color.fromRGBO(150, 150, 150, 1),
            fontWeight: FontWeight.normal,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
