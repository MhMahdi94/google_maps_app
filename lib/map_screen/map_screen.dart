import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_app/map_helper/map_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              MapHelper.addNewMarkers(
                const Marker(
                  markerId: MarkerId('2'),
                  position: LatLng(15.568705930182675, 32.5516263861084),
                  infoWindow: InfoWindow(
                    title: 'New Marker',
                    snippet: 'Added',
                  ),
                ),
              );
            },
            child: const Text(
              'Add Location',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          MapHelper.onMapCreated(controller);
        },
        initialCameraPosition: const CameraPosition(
          target: MapHelper.center,
          zoom: 11,
        ),
        markers: MapHelper.markers,
      ),
    );
  }
}
