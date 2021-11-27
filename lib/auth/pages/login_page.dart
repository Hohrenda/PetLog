import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_log/auth/pages/registration_page.dart';
import 'package:pet_log/auth/widgets/custom_text_field.dart';
import 'package:pet_log/auth/widgets/custom_button.dart';
import 'package:pet_log/auth/widgets/logo_with_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 115.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Center(
                  child: LogoWithText(logoText: 'PetLog', fontSizeLogo: 72.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 29.0, bottom: 50.0),
                  child: CustomTextField(
                    validator: (text) => text!.isEmpty ? 'required' : null,
                    labelText: 'email',
                    controller: emailController,
                    obscureText: null,
                  ),
                ),
                CustomTextField(
                    validator: (text) => text!.isEmpty ? 'required' : null,
                    labelText: 'password',
                    controller: passwordController,
                    obscureText: true),
                Padding(
                  padding: const EdgeInsets.only(top: 59.0, bottom: 15.0),
                  child: CustomButton(
                      onPressed: () => {}, buttonText: 'Login', fontSize: 30.0),
                ),
                Text(
                  'or',
                  style: GoogleFonts.roboto(
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 63.0),
                  child: InkWell(
                    onTap: ()  {
                    if (!_formKey.currentState!.validate()) return;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          )
                        ],
                      ),
                      width: 314.0,
                      height: 48.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('lib/assets/google_logo.svg'),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Sign in with Google',
                              style: GoogleFonts.roboto(
                                color: const Color.fromRGBO(0, 0, 0, 0.6),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationPage()),
                    )
                  },
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.montserrat(
                      color: const Color.fromRGBO(61, 224, 146, 1),
                      fontSize: 36.0,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
