import 'package:flutter/material.dart';

import '../../model/poli.dart';
import 'poli_detail.dart';

class PoliItem extends StatelessWidget {
  const PoliItem({
    super.key,
    required this.poli,
    required this.onPoliUpdated,
    required this.onPoliDeleted,
  });

  final Poli poli;
  final ValueChanged<Poli> onPoliUpdated;
  final VoidCallback onPoliDeleted;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          Icons.local_hospital_outlined,
          color: Colors.blue.shade700,
        ),
        title: Text(poli.namaPoli),
        subtitle: const Text('Layanan klinik'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () async {
          final updatedPoli = await Navigator.push<Poli>(
            context,
            MaterialPageRoute(
              builder: (_) => PoliDetail(
                poli: poli,
                onDeleted: onPoliDeleted,
              ),
            ),
          );
          if (updatedPoli != null) onPoliUpdated(updatedPoli);
        },
      ),
    );
  }
}
