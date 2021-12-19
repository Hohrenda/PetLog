import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MedicineDocument extends StatelessWidget {
  final String documentName;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final DateTime? date;
  final String? comments;
  final String? attachmentsCount;

  const MedicineDocument({
    Key? key,
    required this.onEdit,
    required this.onDelete,
    required this.documentName,
    this.date,
    this.comments,
    this.attachmentsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 10.0),
      child: Container(
        width: 320.0,
        height: 100.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240.0,
                    child: Text(
                      documentName,
                      style: GoogleFonts.montserrat(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
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
                            DateFormat('yyyy-MM-dd').format(date!),
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
                        child: SizedBox(
                          width: 200.0,
                          child: Text(
                            comments!,
                            style: GoogleFonts.montserrat(fontSize: 16.0),
                            overflow: TextOverflow.ellipsis,
                          ),
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
                        attachmentsCount!,
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
      ),
    );
  }
}
