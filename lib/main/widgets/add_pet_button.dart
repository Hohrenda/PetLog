import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPetButton extends StatelessWidget {
  const AddPetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(196, 196, 196, 1),
              ),
              width: 115.0,
              height: 92.0,
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 52.0,
                  color: Color.fromRGBO(132, 131, 131, 1),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(196, 196, 196, 1),
                ),
                color: Colors.white,
              ),
              width: 221.0,
              height: 92.0,
              child: Center(
                child: Text(
                  'Add a pet',
                  style: GoogleFonts.montserrat(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
