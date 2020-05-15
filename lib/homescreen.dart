import 'package:flutter/material.dart';
import 'package:siswaapp/FormScreen.dart';
import 'package:siswaapp/model/Kontak.dart';
import 'package:siswaapp/service/ApiService.dart';

ApiService api = new ApiService();
final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Kontak data;
  List<Kontak> allKontak;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text(
          'Siswa CRUD Apps',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange[400],
        automaticallyImplyLeading: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: api.getAllKontak(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Kontak>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              allKontak = snapshot.data;
              if (allKontak == null) {
                return Center(
                  child: Text("Data not found"),
                );
              } else {
                return buildKontakListView(context, allKontak);
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildKontakListView(BuildContext context, List<Kontak> allKontak) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: allKontak.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No Transaction Data",
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                Kontak kontakx = allKontak[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(kontakx.nama),
                              Spacer(),
                              Text(kontakx.alamat),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Spacer(),
                              RaisedButton(
                                child: Text("Ubah",
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.orange[400],
                                onPressed: () {
                                  // panggil FormScreen dengan parameter
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RaisedButton(
                                child: Text("Hapus",
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.orange[400],
                                onPressed: () {
                                  // panggil endpoint hapus
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: allKontak.length,
            ),
    );
  }
}