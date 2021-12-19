import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_log/main/models/document_model.dart';
import 'package:pet_log/main/state/document_notifier.dart';
import 'package:pet_log/main/tabs/medicine/medicine_item_edit_page.dart';
import 'package:pet_log/main/widgets/custom_add_button.dart';
import 'package:pet_log/main/widgets/medicine_document.dart';
import 'package:pet_log/popups/delete_element.dart';
import 'package:provider/provider.dart';

class MedicineItemPage extends StatefulWidget {
  final String itemTitle;
  final String itemIconAsset;
  final String? petId;

  const MedicineItemPage({
    Key? key,
    required this.itemTitle,
    required this.itemIconAsset,
    this.petId,
  }) : super(key: key);

  @override
  _MedicineItemPageState createState() => _MedicineItemPageState();
}

class _MedicineItemPageState extends State<MedicineItemPage> {
  DocumentNotifier? documentNotifier;

  @override
  void initState() {
    super.initState();
    documentNotifier = Provider.of<DocumentNotifier>(context, listen: false);
    documentNotifier!.loadInitialData(widget.petId!, widget.itemTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
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
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('docs')
                .where('petId', isEqualTo: widget.petId)
                .where('documentType', isEqualTo: widget.itemTitle)
                .snapshots(),
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
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16.0),
                      child: InkWell(
                        onTap: () => {},
                        child: MedicineDocument(
                          documentName: data['name'],
                          date: data['date'].toDate(),
                          comments: data['comments'],
                          onEdit: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MedicineItemEditPage(
                                documentType: widget.itemTitle,
                                documentModel: DocumentModel(
                                  petId: data['petId'],
                                  name: data['name'],
                                  date: data['date'],
                                  id: docs[index].id,
                                  comments: data['comments'],
                                  imageUrls:
                                      List<String>.from(data['imageUrls']),
                                ),
                                isEdit: true,
                              ),
                            ),
                          ),
                          onDelete: () => {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DeleteElement(onDelete: () => {});
                              },
                            ),
                          },
                        ),
                      ),
                    );
                  },
                );
              }
              return const Text('');
            },
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            child: CustomAddButton(
              buttonText: 'Add new document',
              fontSize: 24.0,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineItemEditPage(
                    documentType: widget.itemTitle,
                    isEdit: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
