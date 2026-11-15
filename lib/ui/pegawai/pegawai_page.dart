import 'package:flutter/material.dart';
import 'package:klinik_app/widget/sidebar.dart';
import 'package:klinik_app/widget/clinic_page_header.dart';

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
      drawer: const Sidebar(),
      appBar: AppBar(title: const Text('Pegawai')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahPegawai,
        icon: const Icon(Icons.add),
        label: const Text('Tambah pegawai'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
        children: [
          ClinicPageHeader(
            section: 'Tim klinik',
            title: 'Data Pegawai',
            description: 'Kelola informasi tenaga kerja dan kontak klinik.',
            icon: Icons.badge_outlined,
            accentColor: const Color(0xFFB2783F),
            metric: 'Jumlah pegawai: ${_data.length}',
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            onChanged: (value) =>
                setState(() => _query = value.trim().toLowerCase()),
            decoration: const InputDecoration(
              labelText: 'Cari nama atau NIP',
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Daftar pegawai',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF183B3A),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          if (filteredData.isEmpty)
            const ClinicEmptyState(message: 'Data pegawai tidak ditemukan')
          else
            ...filteredData.map(
              (pegawai) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PegawaiItem(
                  pegawai: pegawai,
                  onUbah: _ubah,
                  onHapus: (pegawai) => setState(
                    () => _data.removeWhere((item) => item.id == pegawai.id),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
