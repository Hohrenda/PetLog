import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PetListItem extends StatelessWidget {
  final String namePet;
  final String breedPet;
  final String imageUrl;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PetListItem({
    Key? key,
    required this.namePet,
    required this.breedPet,
    required this.imageUrl,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 100),
      child: Row(
        children: [
          Material(
            child: Image.network(
              imageUrl,
              height: 114.0,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromRGBO(196, 196, 196, 1)),
                color: Colors.white),
            width: 221.0,
            height: 114.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 9.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.folder_shared_outlined,
                            size: 28.0,
                            color: Colors.black,
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
                          const Icon(
                            Icons.pets,
                            size: 28.0,
                            color: Colors.black,
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
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          size: 28.0,
                          color: Colors.black,
                        ),
                        onPressed: onEdit,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.restore_from_trash_outlined,
                          size: 28.0,
                          color: Colors.black,
                        ),
                        onPressed: onDelete,
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
