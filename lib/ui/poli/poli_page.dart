import 'package:flutter/material.dart';
import 'package:klinik_app/widget/sidebar.dart';
import 'package:klinik_app/widget/clinic_page_header.dart';

import '../../model/poli.dart';
import 'poli_form.dart';
import 'poli_item.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  final List<Poli> _listPoli = [
    Poli(namaPoli: 'Poli Anak'),
    Poli(namaPoli: 'Poli Kandungan'),
    Poli(namaPoli: 'Poli Gigi'),
    Poli(namaPoli: 'Poli THT'),
  ];
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _tambahPoli() async {
    final poli = await Navigator.push<Poli>(
      context,
      MaterialPageRoute(builder: (_) => const PoliForm()),
    );
    if (poli != null) setState(() => _listPoli.add(poli));
  }

  @override
  Widget build(BuildContext context) {
    final filteredPoli = _listPoli
        .where((poli) => poli.namaPoli.toLowerCase().contains(_query))
        .toList();

    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(title: const Text('Poli')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahPoli,
        icon: const Icon(Icons.add),
        label: const Text('Tambah poli'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
        children: [
          ClinicPageHeader(
            section: 'Layanan klinik',
            title: 'Data Poli',
            description: 'Atur daftar layanan dan poliklinik klinik.',
            icon: Icons.local_hospital_outlined,
            accentColor: const Color(0xFF176B65),
            metric: 'Jumlah poli: ${_listPoli.length}',
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            onChanged: (value) =>
                setState(() => _query = value.trim().toLowerCase()),
            decoration: const InputDecoration(
              labelText: 'Cari poli',
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Daftar layanan',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF183B3A),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          if (filteredPoli.isEmpty)
            const ClinicEmptyState(message: 'Data poli tidak ditemukan')
          else
            ...filteredPoli.map(
              (poli) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PoliItem(
                  poli: poli,
                  onPoliUpdated: (updated) => setState(() {
                    final originalIndex = _listPoli.indexOf(poli);
                    if (originalIndex != -1) {
                      _listPoli[originalIndex] = updated;
                    }
                  }),
                  onPoliDeleted: () => setState(() => _listPoli.remove(poli)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
