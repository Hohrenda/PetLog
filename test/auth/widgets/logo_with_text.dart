import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_log/auth/widgets/logo_with_text.dart';

void main() {
  group('LogoWithText widget', () {
    testWidgets('LogoWithText has a title and fontsize',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: LogoWithText(
            logoText: 'test',
            fontSizeLogo: 24,
          ),
        ),
      );
      final titleFinder = find.text('test');

      expect(titleFinder, findsOneWidget);
    });
  });
}
