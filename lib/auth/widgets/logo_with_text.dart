import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWithText extends StatelessWidget {
  final String logoText;
  final double fontSizeLogo;

  const LogoWithText(
      {Key? key, required this.logoText, required this.fontSizeLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset('lib/assets/logo.svg'),
        Padding(
          padding: const EdgeInsets.only(top: 23.0),
          child: Text(
            logoText,
            style: GoogleFonts.montserrat(
              fontSize: fontSizeLogo,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
