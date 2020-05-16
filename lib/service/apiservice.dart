import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:siswaapp/model/Kontak.dart';
import 'package:siswaapp/response/KontakResponse.dart';

class ApiService {
  //saya pakai ip komputer saya
  final String baseUrl = "http://192.168.0.106/SiswaApp/public/api/";
  KontakResponse r = new KontakResponse();

  Future<List<Kontak>> getAllKontak() async {
    final response = await http.get(
      baseUrl + "siswa/tampil",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      }
    );

    r = KontakResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      List<Kontak> data = r.data;
      return data;
    } else {
      return null;
    }
  }

  Future<Kontak> create(Kontak kontak) async {
    Map<String, dynamic> inputMap = {
      'nama': kontak.nama,
      'alamat': kontak.alamat
    };
    final response = await http.post(
      baseUrl + "siswa/tambah",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: inputMap,
    );

    r = KontakResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      Kontak data = r.data[0];
      return data;
    } else {
      return null;
    }
  }

  Future<Kontak> update(Kontak kontak) async {
    Map<String, dynamic> inputMap = {
      'nama': kontak.nama,
      'alamat': kontak.alamat,
      'id': kontak.id.toString()
    };
    
    final response = await http.put(
      baseUrl + "siswa/ubah",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: inputMap,
    );

    r = KontakResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      Kontak data = r.data[0];
      return data;
    } else {
      return null;
    }
  }

  Future<Kontak> delete(int id) async {
    // Map<String, dynamic> inputMap = {
    //    'id': id.toString()
    // };
    final response = await http.delete(
      baseUrl + "siswa/hapus/$id",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      // body: inputMap,
    );

    r = KontakResponse.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      Kontak data = r.data[0];
      return data;
    } else {
      return null;
    }
  }
}