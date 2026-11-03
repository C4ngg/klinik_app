import 'package:flutter/material.dart';
import '../../model/pegawai.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  @override
  State<PegawaiUpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nipCtrl.text = widget.pegawai.nip;
    _namaCtrl.text = widget.pegawai.nama;
    _tanggalLahirCtrl.text = widget.pegawai.tanggalLahir;
    _nomorTeleponCtrl.text = widget.pegawai.nomorTelepon;
    _emailCtrl.text = widget.pegawai.email;
    _passwordCtrl.text = widget.pegawai.password; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Pegawai"),
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
              id: widget.pegawai.id,
              nip: _nipCtrl.text,
              nama: _namaCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text,
              nomorTelepon: _nomorTeleponCtrl.text,
              email: _emailCtrl.text,
              password: _passwordCtrl.text);
          Navigator.pop(context, x);
        },
        child: const Text("Simpan Perubahan"));
  }
}
