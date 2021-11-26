import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_log/auth/pages/login_page.dart';
import 'package:pet_log/auth/state/user_notifier.dart';
import 'package:provider/provider.dart';

class PetProfileScreen extends StatefulWidget {
  const PetProfileScreen({Key? key}) : super(key: key);

  @override
  _PetProfileScreenState createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends State<PetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    return Container(
      color: Colors.green,
      child: TextButton(
        child: Text(
          'LogOuttttt',
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
          ),
        ),
        onPressed: () async {
          await userNotifier.logOut().then((_) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginPage(),
              ),
              (route) => false));
        },
      ),
    );
  }
}
