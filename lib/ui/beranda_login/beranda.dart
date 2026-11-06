import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pegawai/pegawai_page.dart';
import 'package:klinik_app/ui/pasien/pasien_page.dart';
import 'package:klinik_app/ui/poli/poli_page.dart';
import 'package:klinik_app/widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Selamat datang, Admin!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text('Pilih menu untuk mengelola data klinik.'),
          const SizedBox(height: 20),
          Card(
            color: Colors.blue.shade50,
            child: ListTile(
              leading: Icon(
                Icons.local_hospital_outlined,
                color: Colors.blue.shade700,
              ),
              title: const Text('Data Poli'),
              subtitle: const Text('Kelola layanan poli klinik'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PoliPage()),
              ),
            ),
          ),
          Card(
            color: Colors.teal.shade50,
            child: ListTile(
              leading: Icon(
                Icons.badge_outlined,
                color: Colors.teal.shade700,
              ),
              title: const Text('Data Pegawai'),
              subtitle: const Text('Kelola data pegawai klinik'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PegawaiPage()),
              ),
            ),
          ),
          Card(
            color: Colors.deepPurple.shade50,
            child: ListTile(
              leading: Icon(
                Icons.people_outline,
                color: Colors.deepPurple.shade600,
              ),
              title: const Text('Data Pasien'),
              subtitle: const Text('Kelola data pasien klinik'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PasienPage()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
