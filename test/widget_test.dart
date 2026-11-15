// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:klinik_app/main.dart';

import 'test_asset_bundle.dart';

void main() {
  testWidgets('aplikasi dibuka pada halaman login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      DefaultAssetBundle(bundle: TestAssetBundle(), child: const MyApp()),
    );

    expect(find.text('Klinik Apps'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Masuk sebagai admin'), findsOneWidget);
  });
}
