import 'package:flutter/material.dart';

import '../../model/poli.dart';
import 'poli_detail.dart';

class PoliItem extends StatelessWidget {
  const PoliItem({
    super.key,
    required this.poli,
    required this.onPoliUpdated,
    required this.onPoliDeleted,
  });

  final Poli poli;
  final ValueChanged<Poli> onPoliUpdated;
  final VoidCallback onPoliDeleted;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () async {
          final updatedPoli = await Navigator.push<Poli>(
            context,
            MaterialPageRoute(
              builder: (_) => PoliDetail(poli: poli, onDeleted: onPoliDeleted),
            ),
          );
          if (updatedPoli != null) onPoliUpdated(updatedPoli);
        },
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
                  color: const Color(0xFFE1F0EA),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.local_hospital_outlined,
                  color: Color(0xFF176B65),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      poli.namaPoli,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF183B3A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      'Layanan klinik',
                      style: TextStyle(color: Color(0xFF71817D)),
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
