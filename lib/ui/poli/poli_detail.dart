import 'package:flutter/material.dart';

import '../../model/poli.dart';
import 'poli_update_form.dart';

class PoliDetail extends StatelessWidget {
  const PoliDetail({
    super.key,
    required this.poli,
    required this.onDeleted,
  });

  final Poli poli;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Poli'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.local_hospital_outlined),
            title: const Text('Nama Poli'),
            subtitle: Text(poli.namaPoli),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue.shade700,
            ),
            onPressed: () async {
              final updated = await Navigator.push<Poli>(
                context,
                MaterialPageRoute(
                  builder: (_) => PoliUpdateForm(poli: poli),
                ),
              );
              if (updated != null && context.mounted) {
                Navigator.pop(context, updated);
              }
            },
            icon: const Icon(Icons.edit),
            label: const Text('Ubah'),
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red.shade700,
            ),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Hapus Poli'),
                  content: const Text('Yakin ingin menghapus data ini?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Batal'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Hapus'),
                    ),
                  ],
                ),
              );
              if (confirmed == true && context.mounted) {
                onDeleted();
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.delete),
            label: const Text('Hapus'),
          ),
        ],
      ),
    );
  }
}
