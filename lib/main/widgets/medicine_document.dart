import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineDocument extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const MedicineDocument({
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Passport',
                  style: GoogleFonts.montserrat(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today_rounded),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '19/10/2021',
                          style: GoogleFonts.montserrat(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.drive_file_rename_outline),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Comments',
                        style: GoogleFonts.montserrat(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.attach_file,
                      size: 28.0,
                    ),
                    Text(
                      '1',
                      style: GoogleFonts.montserrat(fontSize: 16.0),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        size: 34.0,
                      ),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.restore_from_trash_outlined,
                        size: 34.0,
                      ),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
