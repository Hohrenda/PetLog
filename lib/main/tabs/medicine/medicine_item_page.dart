import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_log/main/widgets/custom_add_button.dart';

class MedicineItemPage extends StatefulWidget {
  final String itemTitle;
  final String itemIconAsset;

  const MedicineItemPage({
    Key? key,
    required this.itemTitle,
    required this.itemIconAsset,
  }) : super(key: key);

  @override
  _MedicineItemPageState createState() => _MedicineItemPageState();
}

class _MedicineItemPageState extends State<MedicineItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 17.0, bottom: 5.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      widget.itemIconAsset,
                      width: 40.0,
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        widget.itemTitle,
                        style: GoogleFonts.montserrat(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(61, 224, 146, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
            ],
          ),
          CustomAddButton(
            buttonText: 'Add new document',
            fontSize: 24.0,
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
