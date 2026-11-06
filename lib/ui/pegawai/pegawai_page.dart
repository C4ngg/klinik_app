import 'package:flutter/material.dart';
import 'package:klinik_app/widget/sidebar.dart';

import '../../model/pegawai.dart';
import 'pegawai_form.dart';
import 'pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PageState();
}

class _PageState extends State<PegawaiPage> {
  final List<Pegawai> _data = [
    Pegawai(
      id: '1',
      nip: '198501012010011001',
      nama: 'Budi Santoso',
      tanggalLahir: '1985-01-01',
      nomorTelepon: '081234567890',
      email: 'budi@klinik.com',
      password: 'password123',
    ),
    Pegawai(
      id: '2',
      nip: '199002022015022002',
      nama: 'Siti Aminah',
      tanggalLahir: '1990-02-02',
      nomorTelepon: '081298765432',
      email: 'siti@klinik.com',
      password: 'password123',
    ),
  ];
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _ubah(Pegawai pegawai) {
    setState(() {
      final index = _data.indexWhere((item) => item.id == pegawai.id);
      if (index != -1) _data[index] = pegawai;
    });
  }

  Future<void> _tambahPegawai() async {
    final pegawai = await Navigator.push<Pegawai>(
      context,
      MaterialPageRoute(builder: (_) => const PegawaiForm()),
    );
    if (pegawai != null) setState(() => _data.add(pegawai));
  }

  @override
  Widget build(BuildContext context) {
    final filteredData = _data.where((pegawai) {
      return pegawai.nama.toLowerCase().contains(_query) ||
          pegawai.nip.toLowerCase().contains(_query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Data Pegawai'),
        backgroundColor: Colors.deepPurple.shade600,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _tambahPegawai,
            icon: const Icon(Icons.add),
            tooltip: 'Tambah pegawai',
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
                  'Jumlah pegawai: ${_data.length}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.deepPurple.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _searchController,
                  onChanged: (value) =>
                      setState(() => _query = value.trim().toLowerCase()),
                  decoration: InputDecoration(
                    labelText: 'Cari nama atau NIP',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.deepPurple.shade600,
                    ),
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
                ? const Center(child: Text('Data pegawai tidak ditemukan'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) => PegawaiItem(
                      pegawai: filteredData[index],
                      onUbah: _ubah,
                      onHapus: (pegawai) => setState(
                        () =>
                            _data.removeWhere((item) => item.id == pegawai.id),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
