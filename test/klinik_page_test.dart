import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klinik_app/ui/pasien/pasien_page.dart';
import 'package:klinik_app/ui/pegawai/pegawai_page.dart';
import 'package:klinik_app/ui/poli/poli_page.dart';

void main() {
  testWidgets('pencarian Poli menyaring hasil dan hapus memperbarui jumlah', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: PoliPage()));

    expect(find.text('Jumlah poli: 4'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'anak');
    await tester.pumpAndSettle();
    expect(find.text('Poli Anak'), findsOneWidget);
    expect(find.text('Poli Gigi'), findsNothing);

    await tester.tap(find.text('Poli Anak'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Hapus').first);
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Hapus').last);
    await tester.pumpAndSettle();

    expect(find.text('Poli Anak'), findsNothing);
    expect(find.text('Jumlah poli: 3'), findsOneWidget);
  });

  testWidgets('pencarian Pasien menemukan nama dan nomor rekam medis', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: PasienPage()));

    expect(find.text('Jumlah pasien: 2'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'RM-0002');
    await tester.pumpAndSettle();

    expect(find.text('Dewi Lestari'), findsOneWidget);
    expect(find.text('Andi Wijaya'), findsNothing);
  });

  testWidgets('pencarian Pegawai menemukan nama dan NIP', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: PegawaiPage()));

    expect(find.text('Jumlah pegawai: 2'), findsOneWidget);
    await tester.enterText(find.byType(TextField).first, 'siti');
    await tester.pumpAndSettle();

    expect(find.text('Siti Aminah'), findsOneWidget);
    expect(find.text('Budi Santoso'), findsNothing);
  });
}
