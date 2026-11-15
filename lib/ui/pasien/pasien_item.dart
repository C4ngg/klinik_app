import 'package:flutter/material.dart';

import '../../model/pasien.dart';
import 'pasien_detail.dart';

class PasienItem extends StatelessWidget {
  const PasienItem({
    super.key,
    required this.pasien,
    required this.onUbah,
    required this.onHapus,
  });

  final Pasien pasien;
  final ValueChanged<Pasien> onUbah;
  final ValueChanged<Pasien> onHapus;

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
            builder: (_) =>
                PasienDetail(pasien: pasien, onUbah: onUbah, onHapus: onHapus),
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
                  color: const Color(0xFFE8EDF5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF5977A2),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pasien.nama,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF183B3A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'No. RM: ${pasien.nomorRm}',
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
