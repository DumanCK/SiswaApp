import 'package:flutter/material.dart';
import 'package:siswaapp/HomeScreen.dart';
//import 'package:siswaapp/FormScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Siswa CRUD Apps',
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.greenAccent,
        ),
      home: HomeScreen(),
    );
  }
}