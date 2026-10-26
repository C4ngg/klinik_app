import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_form.dart';
import 'pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PegawaiForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(
              pegawai: Pegawai(
                  nip: "198501012010011001",
                  nama: "Budi Santoso",
                  tanggal_Lahir: "1985-01-01",
                  no_Telepon: "081234567890",
                  email: "budi@klinik.com",
                  password: "rahasia123")),
          PegawaiItem(
              pegawai: Pegawai(
                  nip: "199002022015022002",
                  nama: "Siti Aminah",
                  tanggal_Lahir: "1990-02-02",
                  no_Telepon: "081298765432",
                  email: "siti@klinik.com",
                  password: "rahasia123")),
          PegawaiItem(
              pegawai: Pegawai(
                  nip: "198803032012031003",
                  nama: "Rudi Hartono",
                  tanggal_Lahir: "1988-03-03",
                  no_Telepon: "085711112222",
                  email: "rudi@klinik.com",
                  password: "rahasia123")),
        ],
      ),
    );
  }
}
