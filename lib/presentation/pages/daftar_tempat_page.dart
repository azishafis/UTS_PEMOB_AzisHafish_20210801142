import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class DaftarTempatPage extends StatelessWidget {
  final List<Map<String, dynamic>> _villages = [
    {
      "name": "Kantor Kelurahan Binong",
      "coordinates": LatLng(-6.2401895153512825, 106.58136938345739),
    },
    {
      "name": "SPBU Binong",
      "coordinates": LatLng(-6.237687367121639, 106.58339539148842),
      
    },
  ];

  final Function(LatLng) onVillageSelected;

  DaftarTempatPage({required this.onVillageSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Desa'),
      ),
      body: ListView.builder(
        itemCount: _villages.length,
        itemBuilder: (context, index) {
          final village = _villages[index];
          return ListTile(
            title: Text(village['name']),
            subtitle: Text(
                "Lat: ${village['coordinates'].latitude}, Lng: ${village['coordinates'].longitude}"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              onVillageSelected(village['coordinates']); 
            },
          );
        },
      ),
    );
  }
}
