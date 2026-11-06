import 'package:flutter/material.dart';

import '../../model/pasien.dart';
import 'pasien_detail.dart';

class PasienItem extends StatelessWidget {
  const PasienItem({
    super.key,
    required this.pasien,
    required this.onUbah,
    required this.onHapus,
  });

  final Pasien pasien;
  final ValueChanged<Pasien> onUbah;
  final ValueChanged<Pasien> onHapus;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          foregroundColor: Colors.teal.shade800,
          child: const Icon(Icons.person_outline),
        ),
        title: Text(pasien.nama),
        subtitle: Text('No. RM: ${pasien.nomorRm}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PasienDetail(
              pasien: pasien,
              onUbah: onUbah,
              onHapus: onHapus,
            ),
          ),
        ),
      ),
    );
  }
}
