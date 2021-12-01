import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetTab extends StatelessWidget {
  const PetTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Image.network('https://picsum.photos/250?image=9',width: 180.0,height: 180.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.folder_shared_outlined,
                        size: 28.0,
                        color: Colors.black,
                      ),
                      Text(
                        'Name',
                        style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(0, 0, 0, 0.7),
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.pets,
                          size: 28.0,
                          color: Colors.black,
                        ),
                        Text(
                          'Breed',
                          style: GoogleFonts.montserrat(
                            color: const Color.fromRGBO(0, 0, 0, 0.7),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 28.0,
                        color: Colors.black,
                      ),
                      Text(
                        'Date of birth',
                        style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(0, 0, 0, 0.7),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.cake,
                          size: 28.0,
                          color: Colors.black,
                        ),
                        Text(
                          '7y 11m 5d',
                          style: GoogleFonts.montserrat(
                            color: const Color.fromRGBO(0, 0, 0, 0.7),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
