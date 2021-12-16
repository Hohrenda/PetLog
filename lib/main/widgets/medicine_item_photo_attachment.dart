import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MedicineItemPhotoAttachment extends StatelessWidget {
  final VoidCallback onDelete;

  const MedicineItemPhotoAttachment({
    Key? key,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 10.0, bottom: 12.0),
      child: Row(
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            color: Colors.grey,
          ),
          Container(
            width: 220.0,
            height: 150.0,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DateFormat('yyyy-MM-dd - hh:mm').format(DateTime.now()),
                    style: GoogleFonts.montserrat(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.restore_from_trash_outlined),
                    iconSize: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
