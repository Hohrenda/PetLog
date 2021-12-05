import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:pet_log/main/widgets/pet_info_item.dart';
import 'package:pet_log/main/widgets/pet_event_item.dart';
import 'package:provider/provider.dart';

class PetTab extends StatelessWidget {
  final String namePet;
  final String breedPet;
  final DateTime dateBirthPet;

  const PetTab({
    Key? key,
    required this.namePet,
    required this.breedPet,
    required this.dateBirthPet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PetModel? petModel =
        Provider.of<PetNotifier>(context, listen: false).currentPet;
    final String difDate = Jiffy(dateBirthPet.toString()).fromNow();
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
              petModel!.imageUrl != null
                  ? Material(
                      child: Image.network(
                        petModel.imageUrl!,
                        width: 180.0,
                        height: 180.0,
                      ),
                    )
                  : Container(
                      width: 180.0,
                      height: 180.0,
                      color: const Color.fromRGBO(196, 196, 196, 1),
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset('lib/assets/dog_icon.svg'),
                          ),
                        ],
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PetInfoItem(
                    text: namePet,
                    iconInfo: Icons.folder_shared_outlined,
                    fontSize: 25.0,
                  ),
                  PetInfoItem(
                    text: breedPet,
                    iconInfo: Icons.pets,
                    fontSize: 18.0,
                  ),
                  PetInfoItem(
                    text: DateFormat('yyyy-MM-dd').format(dateBirthPet),
                    iconInfo: Icons.calendar_today,
                    fontSize: 14.0,
                  ),
                  PetInfoItem(
                    text: difDate,
                    iconInfo: Icons.cake,
                    fontSize: 14.0,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 80,
          ),
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
