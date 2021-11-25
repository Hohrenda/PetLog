import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_log/auth/widgets/custom_button.dart';
import 'package:pet_log/auth/widgets/custom_text_field.dart';
import 'package:pet_log/main/models/pet_model.dart';


class EditPage extends StatefulWidget {
  final bool isEdit;
  final PetModel? petModel;

  const EditPage({Key? key, required this.isEdit, this.petModel})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.value = TextEditingValue(text: picked.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 66.0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 8.0),
          icon: Icon(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    color: Color.fromRGBO(196, 196, 196, 1),
                    width: 200.0,
                    height: 160.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText:
                              widget.isEdit ? widget.petModel!.name : 'Name',
                          controller: nameController,
                          width: 140.0,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: CustomTextField(
                            labelText: 'Type',
                            controller: typeController,
                            width: 140.0,
                          ),
                        ),
                        CustomTextField(
                          labelText: 'Gender',
                          controller: genderController,
                          width: 140.0,
                        ),
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
              Divider(
                color: Colors.black,
                thickness: 1.0,
                height: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                child: Column(
                  children: [
                    CustomTextField(
                        labelText: widget.isEdit
                            ? (widget.petModel!.breed ?? '')
                            : 'Breed',
                        controller: breedController),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 28.0,
                        bottom: 28.0,
                      ),
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: CustomTextField(
                              labelText: widget.isEdit
                                  ? widget.petModel!.date.toString()
                                  : 'Date',
                              controller: dateController),
                        ),
                      ),
                    ),
                    CustomTextField(
                        labelText: widget.isEdit
                            ? (widget.petModel!.color ?? '')
                            : 'Color',
                        controller: colorController),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 28.0,
                        bottom: 50.0,
                      ),
                      child: CustomTextField(
                          labelText: widget.isEdit
                              ? (widget.petModel!.comments ?? '')
                              : 'Comments',
                          controller: commentsController),
                    ),
                  ],
                ),
              ),
              Center(
                child: CustomButton(
                    onPressed: () => {},
                    buttonText: widget.isEdit ? 'Save' : 'Add pet',
                    fontSize: 30.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
