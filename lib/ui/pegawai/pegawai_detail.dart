import 'package:flutter/material.dart';

import '../../model/pegawai.dart';
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
      appBar: AppBar(
        title: const Text('Detail Pegawai'),
        backgroundColor: Colors.deepPurple.shade600,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.badge_outlined)),
            title: Text(_data.nama),
            subtitle: Text('NIP: ${_data.nip}'),
          ),
          const Divider(),
          _info('Tanggal lahir', _data.tanggalLahir),
          _info('Nomor telepon', _data.nomorTelepon),
          _info('Email', _data.email),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepPurple.shade600,
            ),
            onPressed: _ubahPegawai,
            icon: const Icon(Icons.edit),
            label: const Text('Ubah'),
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red.shade700,
            ),
            onPressed: _hapusPegawai,
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
