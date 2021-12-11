import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_log/main/widgets/medicine_item.dart';

class MedicineTab extends StatefulWidget {
  const MedicineTab({Key? key}) : super(key: key);

  @override
  _MedicineTabState createState() => _MedicineTabState();
}

class _MedicineTabState extends State<MedicineTab> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.05,
      children: [
        MedicineItem(
          svgPictureAsset: 'lib/assets/medicine_documents.svg',
          medicineItemText: 'Documents',
          onTap: () => {
            Navigator.of(context).pushNamed('MedicineItemDocumentsPage'),
          },
        ),
        MedicineItem(
          svgPictureAsset: 'lib/assets/medicine_analyzes.svg',
          medicineItemText: 'Analyzes',
          onTap: () => {},
        ),
        MedicineItem(
          svgPictureAsset: 'lib/assets/medicine_surgeries.svg',
          medicineItemText: 'Surgeries',
          onTap: () => {},
        ),
        MedicineItem(
          svgPictureAsset: 'lib/assets/medicine_allergies.svg',
          medicineItemText: 'Allergies',
          onTap: () => {},
        ),
        MedicineItem(
          svgPictureAsset: 'lib/assets/medicine_veterinarian.svg',
          medicineItemText: 'Veterinarian',
          onTap: () => {},
        ),
        MedicineItem(
          svgPictureAsset: 'lib/assets/medicine_labtests.svg',
          medicineItemText: 'Lab. tests',
          onTap: () => {},
        ),
      ],
    );
  }
}
