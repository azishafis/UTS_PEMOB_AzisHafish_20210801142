import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  double _currentZoom = 13.0; // Level zoom awal

  // Fungsi untuk memindahkan peta ke lokasi tertentu
  void moveToLocation(LatLng coordinates) {
    _mapController.move(coordinates, _currentZoom);
  }

  // Fungsi untuk zoom in
  void _zoomIn() {
    setState(() {
      _currentZoom += 1;
      if (_currentZoom > 18) _currentZoom = 18; // Maksimal zoom
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  // Fungsi untuk zoom out
  void _zoomOut() {
    setState(() {
      _currentZoom -= 1;
      if (_currentZoom < 3) _currentZoom = 3; // Minimal zoom
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peta Desa'),
      ),
      body: Stack(
        children: [
          // Peta
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(-6.240188182192896, 106.58133049142559), // Koordinat pusat
              zoom: _currentZoom, // Gunakan level zoom saat ini
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(-6.240188182192896, 106.58133049142559), // Lokasi marker
                    width: 80.0,
                    height: 80.0,
                    builder: (ctx) => Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Tombol zoom in dan zoom out
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  onPressed: _zoomIn,
                  child: Icon(Icons.zoom_in),
                  mini: true,
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  onPressed: _zoomOut,
                  child: Icon(Icons.zoom_out),
                  mini: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
