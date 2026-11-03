import 'package:flutter/material.dart';
import 'package:klinik_app/widget/sidebar.dart';
import '../../model/poli.dart';
import 'poli_item.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  final List<Poli> _listPoli = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Kandungan"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              final poli = await Navigator.push<Poli>(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );
              if (poli != null) {
                setState(() => _listPoli.add(poli));
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _listPoli.length,
        itemBuilder: (context, index) => PoliItem(
          poli: _listPoli[index],
          onPoliUpdated: (poli) {
            setState(() => _listPoli[index] = poli);
          },
        ),
      ),
    );
  }
}
