import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicineFileAttachment extends StatelessWidget {
  final VoidCallback onDelete;
  final File file;

  const MedicineFileAttachment({
    Key? key,
    required this.onDelete,
    required this.file,
  }) : super(key: key);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 320.0,
            child: InkWell(
              onTap: () => _launchURL(file.path),
              child: Text(
                basename(file.path),
                style: GoogleFonts.montserrat(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.restore_from_trash_outlined),
            iconSize: 40.0,
          ),
        ],
      ),
    );
  }
}
