import 'package:flutter/material.dart';
import 'package:klinik_app/widget/sidebar.dart';
import 'package:klinik_app/widget/clinic_page_header.dart';

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
      drawer: const Sidebar(),
      appBar: AppBar(title: const Text('Pasien')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahPasien,
        icon: const Icon(Icons.add),
        label: const Text('Tambah pasien'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
        children: [
          ClinicPageHeader(
            section: 'Rekam medis',
            title: 'Data Pasien',
            description: 'Temukan dan perbarui informasi pasien klinik.',
            icon: Icons.people_outline,
            accentColor: const Color(0xFF5977A2),
            metric: 'Jumlah pasien: ${_data.length}',
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            onChanged: (value) =>
                setState(() => _query = value.trim().toLowerCase()),
            decoration: const InputDecoration(
              labelText: 'Cari nama atau nomor RM',
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Daftar pasien',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF183B3A),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          if (filteredData.isEmpty)
            const ClinicEmptyState(message: 'Data pasien tidak ditemukan')
          else
            ...filteredData.map(
              (pasien) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PasienItem(
                  pasien: pasien,
                  onUbah: _ubah,
                  onHapus: (pasien) => setState(
                    () => _data.removeWhere((item) => item.id == pasien.id),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
