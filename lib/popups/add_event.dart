import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_log/auth/widgets/custom_button.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final List<SvgPicture> eventItems = <SvgPicture>[
    SvgPicture.asset('lib/assets/bath_icon.svg'),
    SvgPicture.asset('lib/assets/ears_icon.svg'),
    SvgPicture.asset('lib/assets/fleas_and_ticks.svg'),
    SvgPicture.asset('lib/assets/fur_icon.svg'),
    SvgPicture.asset('lib/assets/vaccination_icon.svg'),
    SvgPicture.asset('lib/assets/worm_vaccine.svg'),
  ];
  var dropdownValue = Icons.bathtub;
  String dropdownValueString = 'Bathroom';

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            return Container(
              height: height - 400,
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add new event',
                    style: GoogleFonts.montserrat(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      DropdownButton<IconData>(
                        value: dropdownValue,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (IconData? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items:<IconData>[
                          Icons.bathtub,
                          Icons.medical_services,
                          Icons.pets,
                          Icons.face_unlock_rounded
                        ].map<DropdownMenuItem<IconData>>((IconData value) {
                          return DropdownMenuItem<IconData>(
                            value: value,
                            child: Icon(value),
                          );
                        }).toList(),
                      ),
                      DropdownButton<String>(
                        value: dropdownValueString,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueString = newValue!;
                          });
                        },
                        items: <String>[
                          'Bathroom',
                          'Worm vaccine',
                          'Fleas and ticks',
                          'Fur',
                          'Ears',
                          'Vaccination',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          theme: const DatePickerTheme(backgroundColor: Colors.white),
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                          },
                          currentTime: DateTime.now(),
                          locale: LocaleType.en);
                    },
                    child: const Text(
                      'Select the date',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  CustomButton(onPressed: () => Navigator.pop(context, 'OK'), buttonText: 'Save', fontSize: 14)
                ],
              ),
            );
          },
        ));
  }
}
