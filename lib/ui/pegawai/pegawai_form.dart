import 'package:flutter/material.dart';
import '../../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({Key? key}) : super(key: key);
  @override
  State<PegawaiForm> createState() => _FormState();
}

class _FormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pegawai"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field("NIP", _nipCtrl),
              SizedBox(height: 20),
              _field("Nama", _namaCtrl),
              SizedBox(height: 20),
              _field("Tanggal Lahir (YYYY-MM-DD)", _tanggalLahirCtrl),
              SizedBox(height: 20),
              _field("Nomor Telepon", _nomorTeleponCtrl),
              SizedBox(height: 20),
              _field("Email", _emailCtrl),
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
          Pegawai x = Pegawai(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              nip: _nipCtrl.text,
              nama: _namaCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text,
              nomorTelepon: _nomorTeleponCtrl.text,
              email: _emailCtrl.text,
              password: _passwordCtrl.text);
          Navigator.pop(context, x);
        },
        child: const Text("Simpan"));
  }
}
