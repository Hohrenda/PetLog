import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPageAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(66.0);

  EditPageAppBar({Key? key, required this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      toolbarHeight: 66.0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: 8.0),
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
          size: 40.0,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 27.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'edit',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(255, 120, 63, 1),
    );
  }
}
