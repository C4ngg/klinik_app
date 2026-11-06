import 'package:flutter/material.dart';
import 'package:klinik_app/widget/sidebar.dart';

import '../../model/pasien.dart';
import 'pasien_form.dart';
import 'pasien_item.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PageState();
}

class _PageState extends State<PasienPage> {
  final List<Pasien> _data = [
    Pasien(
      id: '1',
      nomorRm: 'RM-0001',
      nama: 'Andi Wijaya',
      tanggalLahir: '1995-05-05',
      nomorTelepon: '082111222333',
      alamat: 'Jl. Merdeka No. 10',
    ),
    Pasien(
      id: '2',
      nomorRm: 'RM-0002',
      nama: 'Dewi Lestari',
      tanggalLahir: '2000-10-10',
      nomorTelepon: '082444555666',
      alamat: 'Jl. Sudirman No. 5',
    ),
  ];
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _ubah(Pasien pasien) {
    setState(() {
      final index = _data.indexWhere((item) => item.id == pasien.id);
      if (index != -1) _data[index] = pasien;
    });
  }

  Future<void> _tambahPasien() async {
    final pasien = await Navigator.push<Pasien>(
      context,
      MaterialPageRoute(builder: (_) => const PasienForm()),
    );
    if (pasien != null) setState(() => _data.add(pasien));
  }

  @override
  Widget build(BuildContext context) {
    final filteredData = _data.where((pasien) {
      return pasien.nama.toLowerCase().contains(_query) ||
          pasien.nomorRm.toLowerCase().contains(_query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Data Pasien'),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _tambahPasien,
            icon: const Icon(Icons.add),
            tooltip: 'Tambah pasien',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Jumlah pasien: ${_data.length}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.teal.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _searchController,
                  onChanged: (value) => setState(
                    () => _query = value.trim().toLowerCase(),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Cari nama atau nomor RM',
                    prefixIcon: Icon(Icons.search, color: Colors.teal.shade700),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredData.isEmpty
                ? const Center(child: Text('Data pasien tidak ditemukan'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) => PasienItem(
                      pasien: filteredData[index],
                      onUbah: _ubah,
                      onHapus: (pasien) =>
                          setState(() => _data.removeWhere((item) => item.id == pasien.id)),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
