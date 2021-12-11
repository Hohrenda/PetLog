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
      child: Container(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 5.0),
              child: Icon(
                Icons.add,
                size: 40.0,
              ),
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
        color: const Color.fromRGBO(61, 224, 146, 1),
        width: 320.0,
        height: 70.0,
      ),
    );
  }
}
