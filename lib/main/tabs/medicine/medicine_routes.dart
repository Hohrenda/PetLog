import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:provider/provider.dart';

import 'medicine_item_page.dart';
import 'medicine_tab.dart';

class MedicineRoutes extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MedicineRoutes({Key? key, required this.navigatorKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PetModel? petModel =
        Provider.of<PetNotifier>(context, listen: false).currentPet;
    final String? petId = petModel!.id;
    return Navigator(
      key: navigatorKey,
      initialRoute: 'MedicineTab',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'MedicineTab':
            return MaterialPageRoute(
              builder: (context) => MedicineTab(),
              settings: settings,
            );
          case 'Documents':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_documents.svg',
                itemTitle: 'Documents',
                petId: petId,
              ),
              settings: settings,
            );
          case 'Analyzes':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_analyzes.svg',
                itemTitle: 'Analyzes',
                petId: petId,
              ),
              settings: settings,
            );
          case 'Surgeries':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_surgeries.svg',
                itemTitle: 'Surgeries',
                petId: petId,
              ),
              settings: settings,
            );
          case 'Allergies':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_allergies.svg',
                itemTitle: 'Allergies',
                petId: petId,
              ),
              settings: settings,
            );
          case 'Veterinarian':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_veterinarian.svg',
                itemTitle: 'Veterinarian',
                petId: petId,
              ),
              settings: settings,
            );
          case 'Lab. tests':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_labtests.svg',
                itemTitle: 'Lab. tests',
                petId: petId,
              ),
              settings: settings,
            );
          default:
            throw Exception('Invalid route');
        }
      },
    );
  }
}
