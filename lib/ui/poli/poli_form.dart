import 'package:flutter/material.dart';

import '../../model/poli.dart';
import '../../widget/clinic_page_header.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah poli')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ClinicPageHeader(
                  section: 'Layanan klinik',
                  title: 'Tambah poli',
                  description: 'Masukkan nama layanan yang akan ditambahkan.',
                  icon: Icons.local_hospital_outlined,
                  accentColor: Color(0xFF176B65),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: ClinicFormCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _namaPoliCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Nama poli',
                            prefixIcon: Icon(Icons.medical_services_outlined),
                          ),
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                              ? 'Nama poli wajib diisi'
                              : null,
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            Navigator.pop(
                              context,
                              Poli(namaPoli: _namaPoliCtrl.text.trim()),
                            );
                          },
                          icon: const Icon(Icons.check_rounded),
                          label: const Text('Simpan poli'),
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
}
