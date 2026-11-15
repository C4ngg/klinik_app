import 'package:flutter/material.dart';

import '../../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiItem extends StatelessWidget {
  const PegawaiItem({
    super.key,
    required this.pegawai,
    required this.onUbah,
    required this.onHapus,
  });

  final Pegawai pegawai;
  final ValueChanged<Pegawai> onUbah;
  final ValueChanged<Pegawai> onHapus;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PegawaiDetail(
              pegawai: pegawai,
              onUbah: onUbah,
              onHapus: onHapus,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE7EEEA)),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4EADF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.badge_outlined,
                  color: Color(0xFFB2783F),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pegawai.nama,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF183B3A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'NIP: ${pegawai.nip}',
                      style: const TextStyle(color: Color(0xFF71817D)),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Color(0xFF8A9A94),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
