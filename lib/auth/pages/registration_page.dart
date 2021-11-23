import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_log/auth/state/user_notifier.dart';
import 'package:pet_log/auth/widgets/custom_button.dart';
import 'package:pet_log/auth/widgets/custom_text_field.dart';
import 'package:pet_log/auth/widgets/logo_with_text.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 115.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                LogoWithText(logoText: 'Registration', fontSizeLogo: 52.0),
                Padding(
                  padding: const EdgeInsets.only(top: 59.0, bottom: 50.0),
                  child: CustomTextField(
                    labelText: 'email',
                    controller: emailController,
                  ),
                ),
                CustomTextField(
                  labelText: 'password',
                  controller: passwordController,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 59.0),
                  child: CustomTextField(
                    labelText: 'confirm password',
                    controller: confirmPasswordController,
                    obscureText: true,
                  ),
                ),
                CustomButton(
                    onPressed: () async => {
                          await userNotifier.registerNewUser(
                              emailController.text, passwordController.text)
                        },
                    buttonText: 'Sign up',
                    fontSize: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
