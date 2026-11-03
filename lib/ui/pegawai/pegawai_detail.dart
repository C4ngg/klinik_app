import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import 'pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;
  final void Function(Pegawai) onUbah;
  final void Function(Pegawai) onHapus;

  const PegawaiDetail({
    Key? key,
    required this.pegawai,
    required this.onUbah,
    required this.onHapus,
  }) : super(key: key);

  @override
  State<PegawaiDetail> createState() => _DetailState();
}

class _DetailState extends State<PegawaiDetail> {
  late Pegawai _data;

  @override
  void initState() {
    super.initState();
    _data = widget.pegawai;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pegawai"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("NIP : ${_data.nip}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Nama : ${_data.nama}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Tanggal Lahir (YYYY-MM-DD) : ${_data.tanggalLahir}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Nomor Telepon : ${_data.nomorTelepon}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Email : ${_data.email}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tombolUbah(), _tombolHapus()],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () async {
          final hasil = await Navigator.push<Pegawai>(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiUpdateForm(pegawai: _data)));
          if (hasil != null) {
            widget.onUbah(hasil);
            setState(() => _data = hasil);
          }
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
        child: const Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  widget.onHapus(_data);
                  Navigator.pop(context); // tutup dialog
                  Navigator.pop(context); // kembali ke daftar
                },
                child: const Text("YA"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Tidak"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
        child: const Text("Hapus"));
  }
}
