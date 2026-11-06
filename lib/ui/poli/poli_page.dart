import 'package:flutter/material.dart';
import 'package:klinik_app/widget/sidebar.dart';

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
      backgroundColor: Colors.blue.shade50,
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Data Poli'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: _tambahPoli,
            icon: const Icon(Icons.add),
            tooltip: 'Tambah poli',
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
                  'Jumlah poli: ${_listPoli.length}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.blue.shade800,
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
                    labelText: 'Cari poli',
                    prefixIcon: Icon(Icons.search, color: Colors.blue.shade700),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredPoli.isEmpty
                ? const Center(child: Text('Data poli tidak ditemukan'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: filteredPoli.length,
                    itemBuilder: (context, index) {
                      final poli = filteredPoli[index];
                      return PoliItem(
                        poli: poli,
                        onPoliUpdated: (updated) => setState(() {
                          final originalIndex = _listPoli.indexOf(poli);
                          if (originalIndex != -1) {
                            _listPoli[originalIndex] = updated;
                          }
                        }),
                        onPoliDeleted: () =>
                            setState(() => _listPoli.remove(poli)),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
