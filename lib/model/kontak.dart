import 'dart:convert';

class Kontak {
  int id;
  String nama;
  String alamat;

  Kontak({this.id, this.nama, this.alamat});

  factory Kontak.fromJson(Map<String, dynamic> map) {
    return Kontak(
        id: map["id"],
        nama: map["nama"],
        alamat: map["alamat"]);
  }

  static List<Kontak> kontakFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Kontak>.from(data.map((item) => Kontak.fromJson(item)));
  }
}