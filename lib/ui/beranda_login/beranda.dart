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
      appBar: AppBar(title: const Text('Klinik Apps')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF176B65),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'RUANG ADMIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Selamat datang,\nAdmin.',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Semua kebutuhan pengelolaan klinik dalam satu tempat.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.82),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Menu utama',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: const Color(0xFF183B3A),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          _MenuCard(
            icon: Icons.local_hospital_outlined,
            title: 'Data Poli',
            subtitle: 'Kelola layanan poli klinik',
            accentColor: const Color(0xFF176B65),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PoliPage()),
            ),
          ),
          const SizedBox(height: 12),
          _MenuCard(
            icon: Icons.badge_outlined,
            title: 'Data Pegawai',
            subtitle: 'Kelola data pegawai klinik',
            accentColor: const Color(0xFFB2783F),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PegawaiPage()),
            ),
          ),
          const SizedBox(height: 12),
          _MenuCard(
            icon: Icons.people_outline,
            title: 'Data Pasien',
            subtitle: 'Kelola data pasien klinik',
            accentColor: const Color(0xFF5977A2),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PasienPage()),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE7EEEA)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: accentColor),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF183B3A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(color: const Color(0xFF71817D)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, size: 15, color: accentColor),
            ],
          ),
        ),
      ),
    );
  }
}
