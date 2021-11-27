import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_log/auth/pages/login_page.dart';
import 'package:pet_log/auth/state/user_notifier.dart';
import 'package:pet_log/main/widgets/add_pet_button.dart';
import 'package:provider/provider.dart';

import 'edit_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 66.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.black,
                size: 36.0,
              ),
              onPressed: () => userNotifier.logOut().then(
                    (value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const LoginPage(),
                        ),
                        (route) => false),
                  ),
            ),
          )
        ],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('PetLog'),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SvgPicture.asset(
                'lib/assets/logo.svg',
                color: Colors.black,
                width: 28.0,
                height: 31.0,
              ),
            )
          ],
        ),
        backgroundColor: const Color.fromRGBO(255, 120, 63, 1),
        titleTextStyle: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: AddPetButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(isEdit: false),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
