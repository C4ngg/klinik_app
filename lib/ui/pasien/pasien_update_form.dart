import 'package:flutter/material.dart';
import '../../model/pasien.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);
  @override
  State<PasienUpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomorRmCtrl.text = widget.pasien.nomorRm;
    _namaCtrl.text = widget.pasien.nama;
    _tanggalLahirCtrl.text = widget.pasien.tanggalLahir;
    _nomorTeleponCtrl.text = widget.pasien.nomorTelepon;
    _alamatCtrl.text = widget.pasien.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Pasien"),
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
              id: widget.pasien.id,
              nomorRm: _nomorRmCtrl.text,
              nama: _namaCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text,
              nomorTelepon: _nomorTeleponCtrl.text,
              alamat: _alamatCtrl.text);
          Navigator.pop(context, x);
        },
        child: const Text("Simpan Perubahan"));
  }
}
