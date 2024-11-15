import 'package:flutter/material.dart';
import 'daftar_tempat_page.dart';
import 'map_screen.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  // Buat GlobalKey untuk mengakses MapScreen
  final GlobalKey<MapScreenState> mapScreenKey = GlobalKey<MapScreenState>();

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      MapScreen(key: mapScreenKey),
      DaftarTempatPage(onVillageSelected: (coordinates) {
        setState(() {
          _currentIndex = 0;
        });
        mapScreenKey.currentState?.moveToLocation(coordinates);
      }),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Tampilkan layar sesuai tab aktif
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Ganti tab
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Peta Desa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Daftar Desa',
          ),
        ],
      ),
    );
  }
}
