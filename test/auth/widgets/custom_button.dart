import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_log/auth/widgets/custom_button.dart';

void main() {
  group('CustomButton widget', () {
    testWidgets('CustomButton has a title, fontsize and onTap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: CustomButton(
              onPressed: () {},
              buttonText: 'test',
              fontSize: 24,
            ),
          ),
        ),
      );
      final titleFinder = find.text('test');

      expect(titleFinder, findsOneWidget);
    });
  });
}
