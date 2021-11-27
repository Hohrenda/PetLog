import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PetListItem extends StatelessWidget {
  final String namePet;
  final String breedPet;

  //final Image imagePet;

  const PetListItem({Key? key, required this.namePet, required this.breedPet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(196, 196, 196, 1)),
              color: Colors.grey,
            ),
            width: 115.0,
            height: 92.0,
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromRGBO(196, 196, 196, 1)),
                color: Colors.white),
            width: 221.0,
            height: 92.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.folder_shared_outlined,
                              size: 28.0,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            namePet,
                            style: GoogleFonts.montserrat(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.pets,
                              size: 28.0,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            breedPet,
                            style: GoogleFonts.montserrat(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 0, 0, 0.7),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          size: 28.0,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.restore_from_trash_outlined,
                          size: 28.0,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
