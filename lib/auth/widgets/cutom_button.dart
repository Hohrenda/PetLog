import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double fontSize;

  const CustomButton(
      {Key? key,
        required this.onPressed,
        required this.buttonText,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 53.0,
        width: 314.0,
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.montserrat(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(61, 224, 146, 1),
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
  }
}
