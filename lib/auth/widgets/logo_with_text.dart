import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWithText extends StatelessWidget {
  final String logoText;

  const LogoWithText({Key? key, required this.logoText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset('lib/assets/logo.svg'),
        Text(logoText),
      ],
    );
  }
}
