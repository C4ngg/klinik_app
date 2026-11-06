import 'package:flutter/material.dart';

import '../../model/pasien.dart';
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
      appBar: AppBar(
        title: const Text('Detail Pasien'),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person_outline)),
            title: Text(_data.nama),
            subtitle: Text('No. RM: ${_data.nomorRm}'),
          ),
          const Divider(),
          _info('Tanggal lahir', _data.tanggalLahir),
          _info('Nomor telepon', _data.nomorTelepon),
          _info('Alamat', _data.alamat),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.teal.shade700,
            ),
            onPressed: _ubahPasien,
            icon: const Icon(Icons.edit),
            label: const Text('Ubah'),
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red.shade700,
            ),
            onPressed: _hapusPasien,
            icon: const Icon(Icons.delete),
            label: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  Widget _info(String label, String value) {
    return ListTile(
      title: Text(label),
      subtitle: Text(value.isEmpty ? '-' : value),
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
