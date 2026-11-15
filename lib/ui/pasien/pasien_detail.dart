import 'package:flutter/material.dart';

import '../../model/pasien.dart';
import '../../widget/clinic_page_header.dart';
import 'pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  const PasienDetail({
    super.key,
    required this.pasien,
    required this.onUbah,
    required this.onHapus,
  });

  final Pasien pasien;
  final ValueChanged<Pasien> onUbah;
  final ValueChanged<Pasien> onHapus;

  @override
  State<PasienDetail> createState() => _DetailState();
}

class _DetailState extends State<PasienDetail> {
  late Pasien _data;

  @override
  void initState() {
    super.initState();
    _data = widget.pasien;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail pasien')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClinicPageHeader(
            section: 'Rekam medis',
            title: _data.nama,
            description: 'Informasi pasien yang terdaftar di klinik.',
            icon: Icons.person_outline,
            accentColor: const Color(0xFF5977A2),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE7EEEA)),
            ),
            child: Column(
              children: [
                ClinicInfoRow(
                  icon: Icons.numbers_outlined,
                  label: 'Nomor rekam medis',
                  value: _data.nomorRm,
                ),
                const Divider(height: 1, indent: 18, endIndent: 18),
                ClinicInfoRow(
                  icon: Icons.cake_outlined,
                  label: 'Tanggal lahir',
                  value: _data.tanggalLahir,
                ),
                const Divider(height: 1, indent: 18, endIndent: 18),
                ClinicInfoRow(
                  icon: Icons.phone_outlined,
                  label: 'Nomor telepon',
                  value: _data.nomorTelepon,
                ),
                const Divider(height: 1, indent: 18, endIndent: 18),
                ClinicInfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Alamat',
                  value: _data.alamat,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: _ubahPasien,
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Ubah data'),
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFB94D45),
            ),
            onPressed: _hapusPasien,
            icon: const Icon(Icons.delete_outline),
            label: const Text('Hapus data'),
          ),
        ],
      ),
    );
  }

  Future<void> _ubahPasien() async {
    final hasil = await Navigator.push<Pasien>(
      context,
      MaterialPageRoute(builder: (_) => PasienUpdateForm(pasien: _data)),
    );
    if (hasil != null && mounted) {
      widget.onUbah(hasil);
      setState(() => _data = hasil);
    }
  }

  Future<void> _hapusPasien() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Pasien'),
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
    if (confirmed == true && mounted) {
      widget.onHapus(_data);
      Navigator.pop(context);
    }
  }
}
