import 'package:flutter/material.dart';

import '../../model/pasien.dart';

class PasienUpdateForm extends StatefulWidget {
  const PasienUpdateForm({super.key, required this.pasien});

  final Pasien pasien;

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
  void dispose() {
    _nomorRmCtrl.dispose();
    _namaCtrl.dispose();
    _tanggalLahirCtrl.dispose();
    _nomorTeleponCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Pasien'),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field('Nomor RM', _nomorRmCtrl),
              _field('Nama', _namaCtrl),
              _field('Tanggal Lahir (YYYY-MM-DD)', _tanggalLahirCtrl),
              _field('Nomor Telepon', _nomorTeleponCtrl),
              _field('Alamat', _alamatCtrl, maxLines: 3),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    Navigator.pop(
                      context,
                      Pasien(
                        id: widget.pasien.id,
                        nomorRm: _nomorRmCtrl.text.trim(),
                        nama: _namaCtrl.text.trim(),
                        tanggalLahir: _tanggalLahirCtrl.text.trim(),
                        nomorTelepon: _nomorTeleponCtrl.text.trim(),
                        alamat: _alamatCtrl.text.trim(),
                      ),
                    );
                  },
                  child: const Text('Simpan Perubahan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) => value == null || value.trim().isEmpty
            ? '$label wajib diisi'
            : null,
      ),
    );
  }
}
