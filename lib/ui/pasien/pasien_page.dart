import 'package:flutter/material.dart';
import '../../model/pasien.dart';
import '../../widget/sidebar.dart';
import 'pasien_form.dart';
import 'pasien_item.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({Key? key}) : super(key: key);
  @override
  State<PasienPage> createState() => _PageState();
}

class _PageState extends State<PasienPage> {
  // Data disimpan di memori (hilang saat aplikasi ditutup)
  final List<Pasien> _data = [
    Pasien(id: '1', nomorRm: 'RM-0001', nama: 'Andi Wijaya', tanggalLahir: '1995-05-05', nomorTelepon: '082111222333', alamat: 'Jl. Merdeka No. 10'),
    Pasien(id: '2', nomorRm: 'RM-0002', nama: 'Dewi Lestari', tanggalLahir: '2000-10-10', nomorTelepon: '082444555666', alamat: 'Jl. Sudirman No. 5'),
  ];

  void _tambah(Pasien x) {
    setState(() => _data.add(x));
  }

  void _ubah(Pasien x) {
    setState(() {
      final i = _data.indexWhere((d) => d.id == x.id);
      if (i != -1) _data[i] = x;
    });
  }

  void _hapus(Pasien x) {
    setState(() => _data.removeWhere((d) => d.id == x.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              final hasil = await Navigator.push<Pasien>(context,
                  MaterialPageRoute(builder: (context) => PasienForm()));
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
                return PasienItem(
                  pasien: _data[index],
                  onUbah: _ubah,
                  onHapus: _hapus,
                );
              },
            ),
    );
  }
}
