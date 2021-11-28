import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_log/auth/widgets/custom_text_field.dart';

void main() {
  group('CustomTextField widget', () {
    testWidgets('CustomTextField has a text and controller',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CustomTextField(
                hintText: 'test',
                controller: TextEditingController(),
              ),
            ),
          ),
        ),
      );
      final titleFinder = find.text('test');

      expect(titleFinder, findsOneWidget);
    });
  });
}
