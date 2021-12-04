import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_log/main/widgets/pet_info_item.dart';
import 'package:pet_log/main/widgets/pet_event_item.dart';

class PetTab extends StatelessWidget {
  const PetTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                'https://picsum.photos/250?image=9',
                width: 180.0,
                height: 180.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  PetInfoItem(
                    text: 'Name',
                    iconInfo: Icons.folder_shared_outlined,
                    fontSize: 25.0,
                  ),
                  PetInfoItem(
                    text: 'breed',
                    iconInfo: Icons.pets,
                    fontSize: 18.0,
                  ),
                  PetInfoItem(
                    text: 'Date of birth',
                    iconInfo: Icons.calendar_today,
                    fontSize: 14.0,
                  ),
                  PetInfoItem(
                    text: '7y 11m 5d',
                    iconInfo: Icons.cake,
                    fontSize: 14.0,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 80,),
          Flexible(
            child: GridView.count(
              crossAxisCount: 3,
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: const [
                PetEventItem(),
                PetEventItem(),
                PetEventItem(),
                PetEventItem(),
                PetEventItem(),
                PetEventItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
