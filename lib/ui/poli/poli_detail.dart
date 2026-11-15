import 'package:flutter/material.dart';

import '../../model/poli.dart';
import '../../widget/clinic_page_header.dart';
import 'poli_update_form.dart';

class PoliDetail extends StatelessWidget {
  const PoliDetail({super.key, required this.poli, required this.onDeleted});

  final Poli poli;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail poli')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClinicPageHeader(
            section: 'Layanan klinik',
            title: poli.namaPoli,
            description: 'Informasi layanan poliklinik.',
            icon: Icons.local_hospital_outlined,
            accentColor: const Color(0xFF176B65),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE7EEEA)),
            ),
            child: ClinicInfoRow(
              icon: Icons.medical_services_outlined,
              label: 'Nama poli',
              value: poli.namaPoli,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () async {
              final updated = await Navigator.push<Poli>(
                context,
                MaterialPageRoute(builder: (_) => PoliUpdateForm(poli: poli)),
              );
              if (updated != null && context.mounted) {
                Navigator.pop(context, updated);
              }
            },
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Ubah data'),
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFB94D45),
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
            icon: const Icon(Icons.delete_outline),
            label: const Text('Hapus data'),
          ),
        ],
      ),
    );
  }
}
