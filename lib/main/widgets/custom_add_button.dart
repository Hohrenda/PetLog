import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAddButton extends StatelessWidget {
  final String buttonText;
  final double fontSize;
  final VoidCallback onTap;

  const CustomAddButton({
    Key? key,
    required this.buttonText,
    required this.fontSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  size: 40.0,
                ),
                Text(
                  buttonText,
                  style: GoogleFonts.montserrat(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          color: const Color.fromRGBO(61, 224, 146, 1),
          height: 70.0,
        ),
      ),
    );
  }
}
