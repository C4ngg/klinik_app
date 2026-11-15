import 'package:flutter/material.dart';

import '../../model/poli.dart';
import '../../widget/clinic_page_header.dart';

class PoliUpdateForm extends StatefulWidget {
  const PoliUpdateForm({super.key, required this.poli});

  final Poli poli;

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaPoliCtrl.text = widget.poli.namaPoli;
  }

  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ubah poli')),
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
                  title: 'Ubah poli',
                  description: 'Perbarui nama layanan poliklinik.',
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
                              Poli(
                                id: widget.poli.id,
                                namaPoli: _namaPoliCtrl.text.trim(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.check_rounded),
                          label: const Text('Simpan perubahan'),
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
