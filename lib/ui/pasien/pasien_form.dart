import 'package:flutter/material.dart';
import '../../model/pasien.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({Key? key}) : super(key: key);
  @override
  State<PasienForm> createState() => _FormState();
}

class _FormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field("Nomor RM", _nomorRmCtrl),
              SizedBox(height: 20),
              _field("Nama", _namaCtrl),
              SizedBox(height: 20),
              _field("Tanggal Lahir (YYYY-MM-DD)", _tanggalLahirCtrl),
              SizedBox(height: 20),
              _field("Nomor Telepon", _nomorTeleponCtrl),
              SizedBox(height: 20),
              _field("Alamat", _alamatCtrl),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _field(String label, TextEditingController ctrl) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: ctrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Pasien x = Pasien(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              nomorRm: _nomorRmCtrl.text,
              nama: _namaCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text,
              nomorTelepon: _nomorTeleponCtrl.text,
              alamat: _alamatCtrl.text);
          Navigator.pop(context, x);
        },
        child: const Text("Simpan"));
  }
}
