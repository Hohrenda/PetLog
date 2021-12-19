import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_log/main/models/pet_model.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:pet_log/main/tabs/events/event_tab.dart';
import 'package:pet_log/main/tabs/gallery_tab.dart';
import 'package:pet_log/main/tabs/medicine/medicine_routes.dart';
import 'package:pet_log/main/tabs/pet_tab.dart';
import 'package:provider/provider.dart';

class PetPage extends StatefulWidget {
  const PetPage({
    Key? key,
  }) : super(key: key);

  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PetModel? _petModel =
        Provider.of<PetNotifier>(context, listen: false).currentPet;
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
        backgroundColor: const Color.fromRGBO(255, 120, 63, 1),
        title: Text(
          _petModel!.name,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 27.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          PetTab(
            namePet: _petModel.name,
            breedPet: _petModel.type,
            dateBirthPet: _petModel.date.toDate(),
          ),
          GalleryTab(),
          EventTab(),
          WillPopScope(
            onWillPop: () async => !await navigatorKey.currentState!.maybePop(),
            child: MedicineRoutes(
              navigatorKey: navigatorKey,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Medicine',
          ),
        ],
        currentIndex: _selectedIndex,
        iconSize: 50.0,
        unselectedItemColor: const Color.fromRGBO(131, 131, 131, 1),
        selectedItemColor: Colors.amber[800],
        unselectedLabelStyle:
            GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w500),
        selectedLabelStyle:
            GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w500),
        onTap: _onItemTapped,
      ),
    );
  }
}
