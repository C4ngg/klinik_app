import 'package:flutter/material.dart';

import '../../model/pegawai.dart';
import '../../widget/clinic_page_header.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

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
  void dispose() {
    _nipCtrl.dispose();
    _namaCtrl.dispose();
    _tanggalLahirCtrl.dispose();
    _nomorTeleponCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah pegawai')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ClinicPageHeader(
                  section: 'Tim klinik',
                  title: 'Tambah pegawai',
                  description:
                      'Lengkapi identitas dan informasi kontak pegawai.',
                  icon: Icons.badge_outlined,
                  accentColor: Color(0xFFB2783F),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: ClinicFormCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _field(
                          'NIP',
                          _nipCtrl,
                          keyboardType: TextInputType.number,
                        ),
                        _field('Nama', _namaCtrl),
                        _field('Tanggal Lahir (YYYY-MM-DD)', _tanggalLahirCtrl),
                        _field(
                          'Nomor Telepon',
                          _nomorTeleponCtrl,
                          keyboardType: TextInputType.phone,
                        ),
                        _field(
                          'Email',
                          _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          validator: _validateEmail,
                        ),
                        _field('Kata sandi', _passwordCtrl, obscureText: true),
                        const SizedBox(height: 4),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            Navigator.pop(
                              context,
                              Pegawai(
                                id: DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                                nip: _nipCtrl.text.trim(),
                                nama: _namaCtrl.text.trim(),
                                tanggalLahir: _tanggalLahirCtrl.text.trim(),
                                nomorTelepon: _nomorTeleponCtrl.text.trim(),
                                email: _emailCtrl.text.trim(),
                                password: _passwordCtrl.text,
                              ),
                            );
                          },
                          icon: const Icon(Icons.check_rounded),
                          label: const Text('Simpan pegawai'),
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
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(labelText: label),
        validator:
            validator ??
            (value) => value == null || value.trim().isEmpty
                ? '$label wajib diisi'
                : null,
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email wajib diisi';
    if (!value.contains('@') || !value.contains('.')) {
      return 'Masukkan alamat email yang valid';
    }
    return null;
  }
}
