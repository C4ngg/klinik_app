import 'package:flutter/material.dart';   
import '../../model/poli.dart';   
import 'poli_detail.dart';   

class PoliItem extends StatelessWidget {   
  final Poli poli;   
  final ValueChanged<Poli> onPoliUpdated;

  const PoliItem({super.key, required this.poli, required this.onPoliUpdated});   
    @override   
    Widget build(BuildContext context) {   
    return GestureDetector(   
      child: Card(   
        child: ListTile(   
          title: Text("${poli.namaPoli}"),   
        ),   
      ),   
      onTap: () async {
        final updatedPoli = await Navigator.push<Poli>(
          context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)),
        );
        if (updatedPoli != null) {
          onPoliUpdated(updatedPoli);
        }
      },   
    );   
  }   
} 