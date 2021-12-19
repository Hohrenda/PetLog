import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pet_log/auth/widgets/custom_button.dart';
import 'package:pet_log/auth/widgets/custom_text_field.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final List<String> eventIcons = [
    'lib/assets/bath_icon.svg',
    'lib/assets/ears_icon.svg',
    'lib/assets/fleas_and_ticks.svg',
    'lib/assets/fur_icon.svg',
    'lib/assets/vaccination_icon.svg',
    'lib/assets/worm_vaccine.svg',
  ];
  final List<String> eventNames = [
    'Bathroom',
    'Worm vaccine',
    'Fleas and ticks',
    'Fur',
    'Ears',
    'Vaccination',
  ];
  String? selectedIcon;
  String? selectedEvent;
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    selectedIcon = eventIcons[0];
    selectedEvent = eventNames[0];
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DropdownButton<String>(
                      value: selectedIcon,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? newIcon) {
                        setState(() {
                          selectedIcon = newIcon!;
                        });
                      },
                      items: eventIcons
                          .map<DropdownMenuItem<String>>((String icon) {
                        return DropdownMenuItem<String>(
                          value: icon,
                          child: SvgPicture.asset(
                            icon,
                            width: 24.0,
                            height: 24.0,
                          ),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      value: selectedEvent,
                      elevation: 16,
                      style:
                          const TextStyle(fontSize: 24.0, color: Colors.black),
                      underline: Container(
                        height: 2.0,
                        color: Colors.black,
                      ),
                      onChanged: (String? event) {
                        setState(() {
                          selectedEvent = event!;
                        });
                      },
                      items: eventNames
                          .map<DropdownMenuItem<String>>((String event) {
                        return DropdownMenuItem<String>(
                          value: event,
                          child: Text(event),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => pickDateTime(context),
                  child: AbsorbPointer(
                    child: CustomTextField(
                      validator: (text) => text!.isEmpty ? 'required' : null,
                      hintText: 'Date',
                      controller: _dateController,
                    ),
                  ),
                ),
                CustomButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    buttonText: 'Save',
                    fontSize: 14)
              ],
            ),
          );
        },
      ),
    );
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      _selectedDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      _dateController.value = TextEditingValue(
        text: DateFormat('hh:mm aaa dd.M.yyyy').format(_selectedDate!),
      );
    });
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: DateTime.now().hour, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: _selectedDate != null
          ? TimeOfDay(hour: _selectedDate!.hour, minute: _selectedDate!.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }
}
