import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import '../../widget/sidebar.dart';
import 'pegawai_form.dart';
import 'pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({Key? key}) : super(key: key);
  @override
  State<PegawaiPage> createState() => _PageState();
}

class _PageState extends State<PegawaiPage> {
  // Data disimpan di memori (hilang saat aplikasi ditutup)
  final List<Pegawai> _data = [
    Pegawai(id: '1', nip: '198501012010011001', nama: 'Budi Santoso', tanggalLahir: '1985-01-01', nomorTelepon: '081234567890', email: 'budi@klinik.com', password: 'password123'),
    Pegawai(id: '2', nip: '199002022015022002', nama: 'Siti Aminah', tanggalLahir: '1990-02-02', nomorTelepon: '081298765432', email: 'siti@klinik.com', password: 'password123'),
  ];

  void _tambah(Pegawai x) {
    setState(() => _data.add(x));
  }

  void _ubah(Pegawai x) {
    setState(() {
      final i = _data.indexWhere((d) => d.id == x.id);
      if (i != -1) _data[i] = x;
    });
  }

  void _hapus(Pegawai x) {
    setState(() => _data.removeWhere((d) => d.id == x.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              final hasil = await Navigator.push<Pegawai>(context,
                  MaterialPageRoute(builder: (context) => PegawaiForm()));
              if (hasil != null) _tambah(hasil);
            },
          )
        ],
      ),
      body: _data.isEmpty
          ? const Center(child: Text('Data Kosong'))
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return PegawaiItem(
                  pegawai: _data[index],
                  onUbah: _ubah,
                  onHapus: _hapus,
                );
              },
            ),
    );
  }
}
