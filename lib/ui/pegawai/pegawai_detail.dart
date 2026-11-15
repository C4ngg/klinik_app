import 'package:flutter/material.dart';

import '../../model/pegawai.dart';
import '../../widget/clinic_page_header.dart';
import 'pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  const PegawaiDetail({
    super.key,
    required this.pegawai,
    required this.onUbah,
    required this.onHapus,
  });

  final Pegawai pegawai;
  final ValueChanged<Pegawai> onUbah;
  final ValueChanged<Pegawai> onHapus;

  @override
  State<PegawaiDetail> createState() => _DetailState();
}

class _DetailState extends State<PegawaiDetail> {
  late Pegawai _data;

  @override
  void initState() {
    super.initState();
    _data = widget.pegawai;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail pegawai')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClinicPageHeader(
            section: 'Tim klinik',
            title: _data.nama,
            description: 'Informasi pegawai dan kontak yang terdaftar.',
            icon: Icons.badge_outlined,
            accentColor: const Color(0xFFB2783F),
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
                  icon: Icons.badge_outlined,
                  label: 'NIP',
                  value: _data.nip,
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
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: _data.email,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: _ubahPegawai,
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Ubah data'),
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFB94D45),
            ),
            onPressed: _hapusPegawai,
            icon: const Icon(Icons.delete_outline),
            label: const Text('Hapus data'),
          ),
        ],
      ),
    );
  }

  Future<void> _ubahPegawai() async {
    final hasil = await Navigator.push<Pegawai>(
      context,
      MaterialPageRoute(builder: (_) => PegawaiUpdateForm(pegawai: _data)),
    );
    if (hasil != null && mounted) {
      widget.onUbah(hasil);
      setState(() => _data = hasil);
    }
  }

  Future<void> _hapusPegawai() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Pegawai'),
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
