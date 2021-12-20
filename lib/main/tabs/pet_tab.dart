import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pet_log/main/models/event_model.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/state/event_notifier.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:pet_log/main/widgets/pet_info_item.dart';
import 'package:pet_log/main/widgets/pet_event_item.dart';
import 'package:provider/provider.dart';

class PetTab extends StatefulWidget {
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
  _PetTabState createState() => _PetTabState();
}

class _PetTabState extends State<PetTab> {
  EventNotifier? _eventNotifier;
  PetNotifier? _petNotifier;
  Stream<List<EventModel>>? eventsStream;

  @override
  void initState() {
    print('Init state');
    super.initState();
    _eventNotifier = Provider.of<EventNotifier>(context, listen: false);
    _petNotifier = Provider.of<PetNotifier>(context, listen: false);

    _eventNotifier!.loadInitialData(_petNotifier!.currentPet!.id!).whenComplete(
          () => setState(
            () {
              eventsStream = _eventNotifier!.eventStream;
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final PetModel? petModel =
        Provider.of<PetNotifier>(context, listen: false).currentPet;
    final String difDate = Jiffy(widget.dateBirthPet.toString()).fromNow();

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 12.0),
        child: Column(
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
                          fit: BoxFit.cover,
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
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      PetInfoItem(
                        text: widget.namePet,
                        iconInfo: Icons.folder_shared_outlined,
                        fontSize: 25.0,
                      ),
                      PetInfoItem(
                        text: widget.breedPet,
                        iconInfo: Icons.pets,
                        fontSize: 14.0,
                      ),
                      PetInfoItem(
                        text:
                            DateFormat('yyyy-MM-dd').format(widget.dateBirthPet),
                        iconInfo: Icons.calendar_today,
                        fontSize: 14.0,
                      ),
                      PetInfoItem(
                        text: difDate,
                        iconInfo: Icons.cake,
                        fontSize: 14.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: Container(
                height: MediaQuery.of(context).size.height/2.5,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    StreamBuilder<List<EventModel>>(
                      stream: eventsStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return Wrap(
                            spacing: 50.0,
                            runSpacing: 60.0,
                            children: snapshot.data!
                                .map<Widget>((event) => PetEventItem(
                                      eventModel: event,
                                    ))
                                .toList(),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
