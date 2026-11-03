import 'package:flutter/material.dart';
import '../../model/pasien.dart';
import 'pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;
  final void Function(Pasien) onUbah;
  final void Function(Pasien) onHapus;

  const PasienDetail({
    Key? key,
    required this.pasien,
    required this.onUbah,
    required this.onHapus,
  }) : super(key: key);

  @override
  State<PasienDetail> createState() => _DetailState();
}

class _DetailState extends State<PasienDetail> {
  late Pasien _data;

  @override
  void initState() {
    super.initState();
    _data = widget.pasien;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pasien"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Nomor RM : ${_data.nomorRm}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Nama : ${_data.nama}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Tanggal Lahir (YYYY-MM-DD) : ${_data.tanggalLahir}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Nomor Telepon : ${_data.nomorTelepon}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text("Alamat : ${_data.alamat}", style: TextStyle(fontSize: 20)),
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
          final hasil = await Navigator.push<Pasien>(
              context,
              MaterialPageRoute(
                  builder: (context) => PasienUpdateForm(pasien: _data)));
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
