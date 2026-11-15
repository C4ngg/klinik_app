import 'package:flutter/material.dart';

import '../../model/pasien.dart';
import '../../widget/clinic_page_header.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

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
      appBar: AppBar(title: const Text('Tambah pasien')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ClinicPageHeader(
                  section: 'Rekam medis',
                  title: 'Tambah pasien',
                  description:
                      'Lengkapi identitas dan informasi kontak pasien.',
                  icon: Icons.people_outline,
                  accentColor: Color(0xFF5977A2),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: ClinicFormCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _field('Nomor RM', _nomorRmCtrl),
                        _field('Nama', _namaCtrl),
                        _field('Tanggal Lahir (YYYY-MM-DD)', _tanggalLahirCtrl),
                        _field('Nomor Telepon', _nomorTeleponCtrl),
                        _field('Alamat', _alamatCtrl, maxLines: 3),
                        const SizedBox(height: 4),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            Navigator.pop(
                              context,
                              Pasien(
                                id: DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                                nomorRm: _nomorRmCtrl.text.trim(),
                                nama: _namaCtrl.text.trim(),
                                tanggalLahir: _tanggalLahirCtrl.text.trim(),
                                nomorTelepon: _nomorTeleponCtrl.text.trim(),
                                alamat: _alamatCtrl.text.trim(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.check_rounded),
                          label: const Text('Simpan pasien'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
        decoration: InputDecoration(labelText: label),
        validator: (value) =>
            value == null || value.trim().isEmpty ? '$label wajib diisi' : null,
      ),
    );
  }
}
