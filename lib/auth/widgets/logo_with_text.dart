import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWithText extends StatelessWidget {
  final double fontSizeText;
  final String logoText;

  const LogoWithText({Key? key, required this.logoText, required this.fontSizeText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset('lib/assets/logo.svg'),
        Padding(
          padding: const EdgeInsets.only(top:23.0),
          child: Text(logoText, style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: fontSizeText,
          )),
        ),
      ],
    );
  }
}
