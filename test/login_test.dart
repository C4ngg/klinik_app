import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klinik_app/ui/beranda_login/login.dart';

void main() {
  testWidgets('login memvalidasi input dan membuka beranda', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Login()));

    expect(find.text('Klinik Apps'), findsOneWidget);
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Username wajib diisi'), findsOneWidget);
    expect(find.text('Password wajib diisi'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'admin');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Selamat datang, Admin!'), findsOneWidget);
  });
}
