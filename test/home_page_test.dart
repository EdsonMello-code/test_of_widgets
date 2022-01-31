// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:teste_widget/home_page.dart';

import 'package:teste_widget/person_controller.dart';

void main() {
  testWidgets('Should have widget text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await _createWidget(tester);

    await tester.pumpAndSettle();
    final textWidget = find.byType(Text);

    expect(textWidget, findsOneWidget);
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsNothing);
  });
}

_createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: ChangeNotifierProvider<PersonController>(
        create: (_) => PersonController(),
        child: const HomePage(),
      ),
    ),
  );
}
