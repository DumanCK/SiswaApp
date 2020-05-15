import 'package:siswaapp/model/Kontak.dart';

class KontakResponse {
  bool status;
  String message;
  List<Kontak> data;

  KontakResponse({this.status, this.message, this.data});

  factory KontakResponse.fromJson(Map<String, dynamic> map) {
    // cast dynamic object to model (Kontak)
    var allKontak = map['data'] as List;
    List<Kontak> kontakList = allKontak.map((i) => Kontak.fromJson(i)).toList();

    return KontakResponse(
        status: map["status"], message: map["message"], data: kontakList);
  }
}