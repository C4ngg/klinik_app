import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_form.dart';
import 'pasien_item.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PasienForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PasienItem(
              pasien: Pasien(
                  nomorRM: "RM-0001",
                  nama: "Ahmad Fauzi",
                  tanggalLahir: "1995-05-10",
                  noTelepon: "081311112222",
                  alamat: "Jl. Margonda No. 10, Depok")),
          PasienItem(
              pasien: Pasien(
                  nomorRM: "RM-0002",
                  nama: "Rina Marlina",
                  tanggalLahir: "2000-08-17",
                  noTelepon: "081322223333",
                  alamat: "Jl. Raya Bogor No. 25")),
          PasienItem(
              pasien: Pasien(
                  nomorRM: "RM-0003",
                  nama: "Joko Widodo",
                  tanggalLahir: "1978-11-21",
                  noTelepon: "081333334444",
                  alamat: "Jl. Kenanga No. 5")),
        ],
      ),
    );
  }
}
