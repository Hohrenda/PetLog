import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:pet_log/auth/widgets/custom_button.dart';
import 'package:pet_log/auth/widgets/custom_text_field.dart';
import 'package:pet_log/main/models/document_model.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/state/document_notifier.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:pet_log/main/widgets/edit_page_app_bar.dart';
import 'package:pet_log/main/widgets/medicine_file_attachment.dart';
import 'package:pet_log/popups/delete_element.dart';
import 'package:provider/provider.dart';

class MedicineItemEditPage extends StatefulWidget {
  String? documentType;
  final bool isEdit;
  DocumentModel? documentModel;

  MedicineItemEditPage({
    Key? key,
    this.documentType,
    required this.isEdit,
    this.documentModel,
  }) : super(key: key);

  @override
  _MedicineItemEditPageState createState() => _MedicineItemEditPageState();
}

class _MedicineItemEditPageState extends State<MedicineItemEditPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();
  PetNotifier? _petNotifier;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.value = TextEditingValue(
          text: DateFormat('yyyy-MM-dd').format(picked),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _petNotifier = Provider.of<PetNotifier>(context, listen: false);

    if (widget.isEdit) {
      _nameController.text = widget.documentModel!.name;
      DateTime databaseDate = widget.documentModel!.date.toDate();
      _selectedDate = databaseDate;
      _dateController.text = DateFormat('yyyy-MM-dd').format(databaseDate);
      _commentsController.text = widget.documentModel!.comments ?? '';
    } else {
      _selectedDate = DateTime.now();
      widget.documentModel = DocumentModel(
        name: '',
        petId: '',
        date: Timestamp.now(),
        fileUrls: [],
        comments: '',
        documentType: widget.documentType,
      );
    }
  }

  DocumentModel createDocumentModel() {
    return DocumentModel(
      id: widget.documentModel?.id,
      petId: _petNotifier!.currentPet!.id!,
      documentType: widget.documentType,
      name: _nameController.text,
      date: Timestamp.fromDate(_selectedDate!),
      comments: _commentsController.text,
      fileUrls: widget.documentModel?.fileUrls,
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  @override
  Widget build(BuildContext context) {
    final PetModel? petModel =
        Provider.of<PetNotifier>(context, listen: false).currentPet;
    DocumentNotifier _documentNotifier =
        Provider.of<DocumentNotifier>(context, listen: false);
    final DocumentModel? documentModel = _documentNotifier.currentDocument =
        widget.isEdit ? widget.documentModel : createDocumentModel();
    return Scaffold(
      appBar: EditPageAppBar(title: widget.documentType!),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 18.0, bottom: 12.0),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Name',
                      controller: _nameController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: CustomTextField(
                            validator: (text) =>
                                text!.isEmpty ? 'required' : null,
                            hintText: 'Date',
                            controller: _dateController,
                          ),
                        ),
                      ),
                    ),
                    CustomTextField(
                      hintText: 'Comments',
                      controller: _commentsController,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Additional information',
                      style: GoogleFonts.montserrat(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        _documentNotifier.pickFiles(
                          petModel!.id!,
                          documentModel!.documentType!,
                          () {
                            documentModel.fileUrls
                                ?.insertAll(0, _documentNotifier.fileUrls);
                          },
                        );
                      },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.drive_folder_upload_rounded,
                            size: 40.0,
                          ),
                          Text(
                            'Upload',
                            style: GoogleFonts.montserrat(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
              widget.isEdit
                  ? StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('docs')
                          .doc('${widget.documentModel!.id}')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: documentModel!.fileUrls!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: MedicineFileAttachment(
                                  file: File(documentModel.fileUrls![index]),
                                  onDelete: () => {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DeleteElement(
                                          onDelete: () async => {
                                            await FirebaseStorage.instance
                                                .refFromURL(documentModel
                                                    .fileUrls![index])
                                                .delete(),
                                            documentModel.fileUrls!
                                                .removeAt(index),
                                            if (widget.isEdit)
                                              {
                                                await _documentNotifier
                                                    .updateDocument(
                                                        documentModel),
                                              }
                                          },
                                        );
                                      },
                                    ),
                                  },
                                ),
                              );
                            },
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  : const Text(''),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: CustomButton(
                    onPressed: () async => {
                      if (widget.isEdit)
                        {
                          await _documentNotifier
                              .updateDocument(createDocumentModel()),
                          Navigator.of(context).pop(),
                        }
                      else
                        {
                          await _documentNotifier
                              .addDocument(createDocumentModel()),
                          Navigator.of(context).pop(),
                        }
                    },
                    buttonText: widget.isEdit ? 'Save' : 'Add document',
                    fontSize: 24.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
