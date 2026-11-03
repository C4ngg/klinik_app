import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;
  final void Function(Pegawai) onUbah;
  final void Function(Pegawai) onHapus;

  const PegawaiItem({
    Key? key,
    required this.pegawai,
    required this.onUbah,
    required this.onHapus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pegawai.nama}"),
          subtitle: Text("NIP: ${pegawai.nip}"),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PegawaiDetail(
                    pegawai: pegawai, onUbah: onUbah, onHapus: onHapus)));
      },
    );
  }
}
