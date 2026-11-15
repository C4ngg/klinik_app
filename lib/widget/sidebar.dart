import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pegawai/pegawai_page.dart';

import '../ui/beranda_login/beranda.dart';
import '../ui/beranda_login/login.dart';
import '../ui/poli/poli_page.dart';
import '../ui/pasien/pasien_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(22, 52, 22, 24),
            decoration: const BoxDecoration(
              color: Color(0xFF176B65),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Icon(
                    Icons.health_and_safety_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Klinik Apps',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Administrator',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.78),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _SidebarTile(
            icon: Icons.home_outlined,
            title: 'Beranda',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Beranda()),
            ),
          ),
          _SidebarTile(
            icon: Icons.local_hospital_outlined,
            title: 'Poli',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PoliPage()),
            ),
          ),
          _SidebarTile(
            icon: Icons.badge_outlined,
            title: 'Pegawai',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PegawaiPage()),
            ),
          ),
          _SidebarTile(
            icon: Icons.people_outline,
            title: 'Pasien',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PasienPage()),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Divider(height: 1),
          ),
          _SidebarTile(
            icon: Icons.logout_rounded,
            title: 'Keluar',
            iconColor: const Color(0xFFB94D45),
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const Login()),
              (Route<dynamic> route) => false,
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = const Color(0xFF176B65),
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 22),
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF183B3A),
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
