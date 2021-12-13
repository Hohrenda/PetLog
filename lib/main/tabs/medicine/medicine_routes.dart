import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'medicine_item_page.dart';
import 'medicine_tab.dart';

class MedicineRoutes extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MedicineRoutes({Key? key, required this.navigatorKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ),
              settings: settings,
            );
          case 'Analyzes':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_analyzes.svg',
                itemTitle: 'Analyzes',
              ),
              settings: settings,
            );
          case 'Surgeries':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_surgeries.svg',
                itemTitle: 'Surgeries',
              ),
              settings: settings,
            );
          case 'Allergies':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_allergies.svg',
                itemTitle: 'Allergies',
              ),
              settings: settings,
            );
          case 'Veterinarian':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_veterinarian.svg',
                itemTitle: 'Veterinarian',
              ),
              settings: settings,
            );
          case 'Lab. tests':
            return MaterialPageRoute(
              builder: (context) => MedicineItemPage(
                itemIconAsset: 'lib/assets/medicine_labtests.svg',
                itemTitle: 'Lab. tests',
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
