import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PetInfoItem extends StatelessWidget {
  final String text;
  final IconData? iconInfo;
  final double fontSize;

  const PetInfoItem({
    Key? key,
    required this.text,
    required this.iconInfo,
    required this.fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           Icon(
            iconInfo,
            size: 28.0,
            color: Colors.black,
          ),
          Flexible(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                color: const Color.fromRGBO(0, 0, 0, 0.7),
                fontSize:fontSize,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
