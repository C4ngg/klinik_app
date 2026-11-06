import 'package:flutter/material.dart';

import '../../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiItem extends StatelessWidget {
  const PegawaiItem({
    super.key,
    required this.pegawai,
    required this.onUbah,
    required this.onHapus,
  });

  final Pegawai pegawai;
  final ValueChanged<Pegawai> onUbah;
  final ValueChanged<Pegawai> onHapus;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          foregroundColor: Colors.deepPurple.shade700,
          child: const Icon(Icons.badge_outlined),
        ),
        title: Text(pegawai.nama),
        subtitle: Text('NIP: ${pegawai.nip}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PegawaiDetail(
              pegawai: pegawai,
              onUbah: onUbah,
              onHapus: onHapus,
            ),
          ),
        ),
      ),
    );
  }
}
