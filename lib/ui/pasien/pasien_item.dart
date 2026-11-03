import 'package:flutter/material.dart';
import '../../model/pasien.dart';
import 'pasien_detail.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  final void Function(Pasien) onUbah;
  final void Function(Pasien) onHapus;

  const PasienItem({
    Key? key,
    required this.pasien,
    required this.onUbah,
    required this.onHapus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pasien.nama}"),
          subtitle: Text("No. RM: ${pasien.nomorRm}"),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PasienDetail(
                    pasien: pasien, onUbah: onUbah, onHapus: onHapus)));
      },
    );
  }
}
