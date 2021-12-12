import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineItem extends StatelessWidget {
  final String svgPictureAsset;
  final String medicineItemText;
  final VoidCallback onTap;

  const MedicineItem({
    Key? key,
    required this.svgPictureAsset,
    required this.medicineItemText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SvgPicture.asset(
              svgPictureAsset,
              width: 90.0,
              height: 90.0,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                medicineItemText,
                style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
