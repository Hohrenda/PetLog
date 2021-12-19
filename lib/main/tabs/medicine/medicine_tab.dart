import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_log/main/widgets/medicine_item.dart';

class MedicineTab extends StatefulWidget {
  const MedicineTab({Key? key}) : super(key: key);

  @override
  _MedicineTabState createState() => _MedicineTabState();
}

class _MedicineTabState extends State<MedicineTab> {
  final Map<String, String> medicineItems = <String, String>{
    'lib/assets/medicine_documents.svg': 'Documents',
    'lib/assets/medicine_analyzes.svg': 'Analyzes',
    'lib/assets/medicine_surgeries.svg': 'Surgeries',
    'lib/assets/medicine_allergies.svg': 'Allergies',
    'lib/assets/medicine_veterinarian.svg': 'Veterinarian',
    'lib/assets/medicine_labtests.svg': 'Lab. tests',
  };

  @override
  Widget build(BuildContext context) {
    var entryList = medicineItems.entries.toList();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.05,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: medicineItems.length,
      itemBuilder: (context, index) {
        return MedicineItem(
          svgPictureAsset: entryList[index].key,
          medicineItemText: entryList[index].value,
          onTap: () => {
            Navigator.of(context).pushNamed(entryList[index].value),
          },
        );
      },
    );
  }
}
