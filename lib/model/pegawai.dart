class Pegawai {
  String? id;
  String nip;
  String nama;
  String tanggal_Lahir;
  String no_Telepon;
  String email;
  String password;

  Pegawai({
    this.id,
    required this.nip,
    required this.nama,
    required this.tanggal_Lahir,
    required this.no_Telepon,
    required this.email,
    required this.password,
  });
}
