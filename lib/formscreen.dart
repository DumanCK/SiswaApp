import 'package:flutter/material.dart';
import 'package:siswaapp/model/Kontak.dart';
import 'package:siswaapp/service/ApiService.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormScreen extends StatefulWidget {
  Kontak kontak;
  FormScreen({this.kontak});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  ApiService api = new ApiService();
  TextEditingController ctrlNama = new TextEditingController();
  TextEditingController ctrlAlamat = new TextEditingController();

  @override
  void initState() {
    if (this.widget.kontak != null) {
      ctrlNama.text = this.widget.kontak.nama;
      ctrlAlamat.text = this.widget.kontak.alamat;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.kontak == null ? "Form Tambah" : "Form Update",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: ctrlNama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nama Siswa',
                hintText: 'Nama Siswa',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: ctrlAlamat,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Alamat Siswa',
                hintText: 'Alamat Siswa',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                RaisedButton(
                  onPressed: () {
                    if (validateInput()) {
                      Kontak dataIn = new Kontak(
                          id: this.widget.kontak != null
                              ? this.widget.kontak.id
                              : 0,
                          nama: ctrlNama.text,
                          alamat: ctrlAlamat.text,);
                      if (this.widget.kontak != null) {
                        api.update(dataIn).then((result) {
                          if (result != null) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Simpan data gagal"),
                            ));
                          }
                        });
                      } else {
                        api.create(dataIn).then((result) {
                          if (result != null) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Simpan data gagal"),
                            ));
                          }
                        });
                      }
                    } else {
                      _scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text("Data belum lengkap"),
                      ));
                    }
                  },
                  child: Text(
                    widget.kontak == null ? "Simpan" : "Ubah",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green[400],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validateInput() {
    if (ctrlNama.text == "" ||
        ctrlAlamat.text == "") {
      return false;
    } else {
      return true;
    }
  }
}