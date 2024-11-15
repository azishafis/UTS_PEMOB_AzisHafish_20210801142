import 'package:flutter/material.dart';
import 'package:uts_pemob_sistem_informasi_geografis_desa/presentation/pages/base_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Informasi Geografis Desa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BasePage(),
    );
  }
}
