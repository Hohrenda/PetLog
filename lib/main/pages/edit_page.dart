import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_log/auth/state/user_notifier.dart';
import 'package:pet_log/auth/widgets/custom_button.dart';
import 'package:pet_log/auth/widgets/custom_text_field.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:pet_log/main/state/photo_notifier.dart';
import 'package:pet_log/main/widgets/custom_drop_down.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EditPage extends StatefulWidget {
  final bool isEdit;
  PetModel? petModel;

  EditPage({Key? key, required this.isEdit, this.petModel}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  UserNotifier? _userNotifier;
  PhotoNotifier? _photoNotifier;
  XFile? _imageFile;

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
    _photoNotifier = Provider.of<PhotoNotifier>(context, listen: false);
    _userNotifier = Provider.of<UserNotifier>(context, listen: false);

    _imageFile = _photoNotifier!.pickedFile;

    if (widget.isEdit) {
      _nameController.text = widget.petModel!.name;
      _typeController.text = widget.petModel!.type;
      _genderController.text = widget.petModel!.gender ?? '';
      _breedController.text = widget.petModel!.breed ?? '';
      DateTime databaseDate = widget.petModel!.date.toDate();
      _selectedDate = databaseDate;
      _dateController.text = DateFormat('yyyy-MM-dd').format(databaseDate);
      _colorController.text = widget.petModel!.color ?? '';
      _commentsController.text = widget.petModel!.comments ?? '';
    } else {
      widget.petModel = PetModel(
        name: '',
        ownerId: '',
        date: Timestamp.now(),
        type: '',
      );
    }
  }

  PetModel createPetModel() {
    return PetModel(
      id: widget.petModel?.id,
      ownerId: _userNotifier!.currentUser!.profile!.userId!,
      name: _nameController.text,
      type: _typeController.text,
      date: Timestamp.fromDate(_selectedDate!),
      gender: _genderController.text,
      breed: _breedController.text,
      color: _colorController.text,
      comments: _commentsController.text,
      imageUrl: widget.petModel?.imageUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    PetNotifier _petNotifier = Provider.of<PetNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 66.0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 8.0),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 40.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.isEdit ? widget.petModel!.name : 'New pet',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 27.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'edit',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(255, 120, 63, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 16.0, top: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: const Color.fromRGBO(196, 196, 196, 1),
                      width: 200.0,
                      height: 160.0,
                      child: Stack(
                        children: [
                          Center(
                            child: widget.petModel?.imageUrl != null
                                ? Image.network(
                                    widget.petModel!.imageUrl!,
                                    width: 200.0,
                                    height: 160.0,
                                    fit: BoxFit.cover,
                                  )
                                : _imageFile != null
                                    ? Image.file(
                                        File(_imageFile!.path),
                                        width: 200.0,
                                        height: 160.0,
                                        fit: BoxFit.cover,
                                      )
                                    : SvgPicture.asset(
                                        'lib/assets/dog_icon.svg'),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              child: const Icon(
                                Icons.add,
                                size: 42.0,
                              ),
                              onTap: () async {
                                final temp = await _photoNotifier!.pickImage();
                                setState(() {
                                  _imageFile = temp;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      child: Column(
                        children: [
                          CustomTextField(
                            validator: (text) =>
                                text!.isEmpty ? 'required' : null,
                            hintText: 'Name',
                            controller: _nameController,
                            width: 140.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: CustomDropDown(
                              validator: (value) =>
                                  value == null ? 'required' : null,
                              controller: _typeController,
                              selectedValue: _typeController.text,
                              items: const <String>[
                                'Dog',
                                'Cat',
                                'Turtle',
                                'Pig'
                              ],
                            ),
                          ),
                          CustomDropDown(
                              validator: (value) =>
                                  value == null ? 'required' : null,
                              controller: _genderController,
                              selectedValue: _genderController.text,
                              items: const <String>['Male', 'Female', 'Other']),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Main information',
                    style: GoogleFonts.montserrat(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1.0,
                  height: 0.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Breed',
                        controller: _breedController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 28.0,
                          bottom: 28.0,
                        ),
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
                        hintText: 'Color',
                        controller: _colorController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 28.0,
                          bottom: 50.0,
                        ),
                        child: CustomTextField(
                          hintText: 'Comments',
                          controller: _commentsController,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: CustomButton(
                      onPressed: () async => {
                            if (widget.isEdit)
                              {
                                if(_imageFile != null){
                                  await _photoNotifier!.uploadImageToFirebase(
                                    _imageFile!,
                                    _userNotifier!.currentUser!.profile!.userId,
                                    _nameController.text,
                                        () {
                                      widget.petModel!.imageUrl =
                                          _photoNotifier!.imageUrl;
                                    },
                                  ),
                                },
                                await _petNotifier.updatePet(createPetModel()),
                                Navigator.of(context).pop(),
                              }
                            else
                              {
                                if (_imageFile != null)
                                  {
                                    await _photoNotifier!.uploadImageToFirebase(
                                      _imageFile!,
                                      _userNotifier!
                                          .currentUser!.profile!.userId,
                                      _nameController.text,
                                      () {
                                        widget.petModel!.imageUrl =
                                            _photoNotifier!.imageUrl;
                                      },
                                    ),
                                  },
                                await _petNotifier.addPet(createPetModel()),
                                Navigator.of(context).pop(),
                              }
                          },
                      buttonText: widget.isEdit ? 'Save' : 'Add pet',
                      fontSize: 30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
